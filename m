Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4447DC5475B
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 16:47:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BF610E4F6;
	Tue, 20 Feb 2024 16:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LlJ+ptIH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7D410E4F6
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 16:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708447647; x=1739983647;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=5Q2TUUB0a8jjcFZaUYb89LIzK6GB2qQcCyKj/0CArCQ=;
 b=LlJ+ptIH8cxUE7YTlzk6VAn2HO+RwqKyenIXE6gnMAVshwFvizDobeyG
 yRMBLEKSZVRyq6rZTxwd8w4rihKp6LeZo2gYnG9yUaO9cH1mN/3Gcf803
 9NuyaTte5wMPRtgfjqcQB2BTz7EIfJLkwq+CHuwFdcFuta8esd1C2VdzU
 TLZpvtlI86/NFJHDbZFceY+pSuXNKkFnyxIYtnMetmaxRDYbNijyHT7vt
 pS4atSWeVrJExAg4ErvzLD0FsPcEv3L5w9G2U+pOHOEhl+3qs9gVjCnB9
 cA8KKOXoLp2FDJZURU0y5V5mhfOVlD4DKN2cfPt/rXvg2DJqz9mKbQYit g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="13974349"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="13974349"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 08:47:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="4793712"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 08:47:23 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 08:47:21 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 08:47:21 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 08:47:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnsPngnP8vwfvzAKmtMkEItaCafeSGVxrU/tEvuZ0UnKrBNNvt/j7lglBaFVWeB49yXgfgZ/YWeQ6f5lZaBpMHJDEeyYXkEd2UoFS0PrgUcvMC5sMZNn038V1X2DxZxMAps97xh57O0ukRc6SMpyDo3nskpsGFpwiJsil75Slmta8Xm1SHYM3+rR3CU4mIm6ZLSEzFVr/xNc6dFDY6bXNW6nQLdSkFgfxL0VLZUOTu2/vG4rOxt+/oqh3w1QxeUK0W0io2NCSPAqMhSmoQsE3myJBUFQGZ5bh3kOF8M5Rsd7nRSyfGm97E9QOMJCaG3BeHgYY1VuyrBTy+R4B2GcQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9oR5nz2s8wXULmwPaRKCW1NWPD618XSuAOzcCRfNP4=;
 b=l4gP2W/OHJSiIT7w4tTyNVRQGCd7tl05zjmBv1xCWB4AMAQZVV4aitHQEXQqi03KXZ0Lu1/LMCOlWFaQH7k0DuORbOETxql0F17gObXtWaSDLW94jFO8RZqGXy08GrxavZK6UhGvXvXTIg/9ithujqVkpQxwUT5OV7BWCNkEkWXSMU2UU1RK1IbA5jKdqmsFYdgNEQOalaDuNAZ8Df2QzSfp5r6qNM3riXf8hAUNq8/lIfZbw0/91wVzB4lQvb5TNP7zbsm/joS9g6Dn3jGu3N/qVDeqa/akFbhUwTRy0dyUYNIxj9c1gjZJ/oAUj9nOHZkU0UuRXpNPoUqVJR6/Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SN7PR11MB7640.namprd11.prod.outlook.com (2603:10b6:806:341::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Tue, 20 Feb
 2024 16:47:19 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::64e6:ee24:79f8:efa]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::64e6:ee24:79f8:efa%4]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 16:47:19 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240207103007.665367-7-luciano.coelho@intel.com>
References: <20240207103007.665367-1-luciano.coelho@intel.com>
 <20240207103007.665367-7-luciano.coelho@intel.com>
Subject: Re: [PATCH 6/6] drm/i915/display: call DMC wakelock enable when DMC
 is loaded
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Luca Coelho <luciano.coelho@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <uma.shankar@intel.com>, <ville.syrjala@linux.intel.com>,
 <jani.nikula@intel.com>
Date: Tue, 20 Feb 2024 13:47:14 -0300
Message-ID: <170844763454.44184.7132459305280750890@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::12) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SN7PR11MB7640:EE_
X-MS-Office365-Filtering-Correlation-Id: 49d2732f-4847-42e8-c048-08dc32339a1b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dbS3ZZ6beFyk+4xYqRG66oA5yUhUo76m857AoYtpvEu4rsABNavuAOFLmuAj4BS48guqp4sC9RisrRiyLDsn4n0eRtUGe5K1pQXotEXsv2Iq7cuaMylONPd1ZW5tBODwjEtkb2A3IvHtKj5T2968yjdMTPiTsSzpX1DvX7xpwdzTz+9r2mjPF8kXBVtDZqjuYdnr4GROK6RKxPcSb2RFO9mVEzDJYEM0SJU9A59QC/kXvjctHUT+dnVh7Yu/xUUYGjeUWOV2Sn0QEksrv9SzJ3pZ+n3y1xiDnlZMpjzDQogbD0zZ/q0aXkHYQqWtDCT0lRKG6sQ/AtIvS8xCG4Tbi/+2JPDLFPPin3KH3Fwq6CdNzdpNfnUOZG6AlnsN2BzZteD+2+rUV2422MtubyllWAaw5S2ydZTmwXxUnvbpdqTZcIHZxL96GE2tA/Mgsm2e7U1aRv/50PDyYKnREzM9bPxfFErum6B/nA8Xc4urlhTcPryix15WXWtHGELrniQ3EcI6vUkmG//0wlVDDfoOJ8oc2oHG89y44wmFU2DZCIdAWqBnl6ZZYIe0rIia/015/BQmqlBRiTmI4JvmsvoRJrJd7R6AfuLb+R2YfaRD4VT4Euq2k5e247MdzhFtGgP6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(16122699003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2RpenRjVFIvSk1HL1VQVStEbExlUHZyMGhWZjA1NFNkbFRwS0x4bFBORk1X?=
 =?utf-8?B?SllOSXJLc2JPUUFqRmV5dVV6SWo5OG9MTHVINWg0M3duK1RtRG1mMGV4dm1l?=
 =?utf-8?B?MWxLVTVoOUw4M3F3aUIvVXluSkhDc2toYWw1bjVRSm41aE85a0dObkVjNkJP?=
 =?utf-8?B?c2dJUUtTZU53L2VDeEtSR25JMU1NUFhtdVBSL1JydHNqQm9Id0VHdHcxTG5Z?=
 =?utf-8?B?dnlpNS9zdW5UOEZaN2hoUHdGMmJMbXlXYkx2RWkrQk1BcEVYV01Sa2g5ZnZ3?=
 =?utf-8?B?YU5Lb001SFR6NXB4QmZYOGdOZTFWVi9YL1lXZms5Q202RTBFTUZLeWQ2a0dk?=
 =?utf-8?B?Z3ZtdFdlM2ptMUd1SkpOTGpsR2RuSzZESDljVm9sMkNaQmNqQkdGWTk5MTM1?=
 =?utf-8?B?d2ZjdFNQaXhTaHRadTdGcEZGUVNFK25Ea2pVVWJJczd3NWs2TjQrQXAzWVlS?=
 =?utf-8?B?ZFl3c2RFS1JLdythZzBCSy9ZNUk5SVRONElQQm4rZG84MEtsL0ExK0g0R3Qr?=
 =?utf-8?B?TzRMQnlhYWFkQWRIL1NGYW9pU1hscjJPUHFnbnYyUU5PUG1GUFRDb0pzR0pW?=
 =?utf-8?B?aHc2M3BwUkNXV1JkZWxOT2I5MGx0VlA1WWM4ampzOTg4NjQzNUdtRWNveGlG?=
 =?utf-8?B?RzdCTWUyNlVYK1lqakRNa2Fvcjl4blMyekd0cXlzUHZSbUhoa25OZkVJdXN4?=
 =?utf-8?B?TEs2eGxpako2QW9kQ3had1lENFg1a05SaTNycTBwRlIrTlRDKzVoK3ZZVnBS?=
 =?utf-8?B?bjdrL0dOK1cwbFV6RWZCVjJIY2x5bWh5SVZ3cjJvYnVYVnV5Z0dVT0RiVEMv?=
 =?utf-8?B?cHhxOGpJNUFUY2F5TENFTlQxc2VwVGFoeUppVmFDYnNQMDV0elJ5RFd0ZzR5?=
 =?utf-8?B?V3kwOFNXR0NQdFIwQTNlQ0xqTkhtbm9iQXoyd1FXNExyb2Y2UWVEQmRqT3R4?=
 =?utf-8?B?NGRPYkdFNGRzV0RYMk1Bek1PSXpVTy9ESWlZcThvbzhoam1lRkxJUmxhNEVK?=
 =?utf-8?B?UXIvd0NZRzZKb1N3STZSOEs4MFN6K1lrc3FyOFNwT1ZzZUltSmdVMEhlRER0?=
 =?utf-8?B?Zjg5MjZiR1ZieFphU3ZYQ3FteTdPRkNpR3J4SFEvUHBkb3RtNktVSkJHaVd2?=
 =?utf-8?B?bHFCVjZvUG85bi9pMkEwU0VGR3NYdVZkckNZeERqZnMwL2xxTGpUUVpGRk1H?=
 =?utf-8?B?a2NSR3NaUXo1SGlqcThGZXZQeisxNFpoa2RIRDJ5OHFtT0xqUlNoaERUc3pG?=
 =?utf-8?B?ZmttZmJMNkVxbjBFc3g5UjVzTUJzUlplSXYrd1RpazhaTmUzRmdlejBKbXFV?=
 =?utf-8?B?elpody85dDZUa2lzSDhqK1ZLcjZZeFZUVHJ6WG9nQU95ajNmQUVRaFNmMWZL?=
 =?utf-8?B?L1A2UVJOYzhtWWxiOG51dnBFVHhncFh0MTF3TkptUGZFckVWREhDdEw0MUNu?=
 =?utf-8?B?NExZMmhwTUlWZ3RWb295dXJMWHN1ZFpSczJwblVLbWoyL2ZIcTFjQkZEazR3?=
 =?utf-8?B?STNaVHdIU0N1RDdCNEJpUmphMWFFYVpOdWV6dDFRNXVsTVVjVXdoRkVKQ1Mz?=
 =?utf-8?B?WlRjWlRUcnB1SFJWdEpFaEtLenVBcUJkWXJLZUU5aVp2VHFvYk5ZbFhmNmpt?=
 =?utf-8?B?UmJVb2V4dWEvaGliOUFTOS9sRzc0aG5mRDk2Z0lIRTJ6M1lqMlh1bXpaWDhy?=
 =?utf-8?B?VmhUVXdGaWdHOTZsdFVsWFhVUWlPbVBGYTNhbDJMTGpGUEVxTWh6VHJqWTJl?=
 =?utf-8?B?alpJYjVGMExpQVlOMURrOGp0YktoSUVVYjdlb2MxMEdPbWR2STNPS2V4OUk4?=
 =?utf-8?B?YTVZZlczdDhtTFVKVThpWlRmUEtTNWIvcHRMMmNDbDFWNmdOOWkyOFZpdmVM?=
 =?utf-8?B?cVVSanZGbUh4c0c1T0RRZnBISnhxME9uMVBLSzlSeDBLbFF2bWhZcDZCQWpx?=
 =?utf-8?B?K0thbkh2YkdDdnY4dkRVdDZsQllTL2lXNVVlcEM0SVl5RHJYK1F5Sng0blVt?=
 =?utf-8?B?S3pmZmwxR1MrcFAzVTd0QUJXY2pzNDMra3ZYV1RFVjhORVBKT1BZZ1ZZTWFI?=
 =?utf-8?B?Nm1IYWhxQm5TK0VTeGFTaGpLMndTUFhXOW1XMXFKUThoMEhqT0ZwbXZ2Zmo2?=
 =?utf-8?B?QmFwMitpUUZaejRPamdJazNrT3VmOWsxS2g1UTBHdUhPektPa3QvOXBnRGV2?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d2732f-4847-42e8-c048-08dc32339a1b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 16:47:19.1338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nbeTV//7/UfBR6gZ+5wC3ZST1zrgYX9yxzlAmL4AzmsLd2WrdMdraWjpPRVtO3BfCJHOqwKQ4+wLruuxr9nSpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7640
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

Quoting Luca Coelho (2024-02-07 07:30:07-03:00)
>Although the documentation says that this should be done in the first
>modeset, it makes more sense to enable and disable it when DMC is
>enabled and disabled, including during suspend and resume operations.

I remember suggesting the pairing wakelock enable/disable with DMC
enable/disable in the RFC. However, after some thought and re-reading
the spec, I actually believe that this should actually be part of the
transition to and out of DC-off power state. Thoughts?

--
Gustavo Sousa

>
>Add the calls to enable and disable DMC wakelock accordingly.
>
>Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
>---
> drivers/gpu/drm/i915/display/intel_dmc.c | 8 ++++++++
> 1 file changed, 8 insertions(+)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i9=
15/display/intel_dmc.c
>index 85009c5ba488..d5d275849f4d 100644
>--- a/drivers/gpu/drm/i915/display/intel_dmc.c
>+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
>@@ -536,6 +536,8 @@ void intel_dmc_load_program(struct drm_i915_private *i=
915)
>         gen9_set_dc_state_debugmask(i915);
>=20
>         pipedmc_clock_gating_wa(i915, false);
>+
>+        intel_dmc_wl_enable(i915);
> }
>=20
> /**
>@@ -553,6 +555,8 @@ void intel_dmc_disable_program(struct drm_i915_private=
 *i915)
>         pipedmc_clock_gating_wa(i915, true);
>         disable_all_event_handlers(i915);
>         pipedmc_clock_gating_wa(i915, false);
>+
>+        intel_dmc_wl_disable(i915);
> }
>=20
> void assert_dmc_loaded(struct drm_i915_private *i915)
>@@ -1085,6 +1089,8 @@ void intel_dmc_suspend(struct drm_i915_private *i915=
)
>         if (dmc)
>                 flush_work(&dmc->work);
>=20
>+        intel_dmc_wl_disable(i915);
>+
>         /* Drop the reference held in case DMC isn't loaded. */
>         if (!intel_dmc_has_payload(i915))
>                 intel_dmc_runtime_pm_put(i915);
>@@ -1108,6 +1114,8 @@ void intel_dmc_resume(struct drm_i915_private *i915)
>          */
>         if (!intel_dmc_has_payload(i915))
>                 intel_dmc_runtime_pm_get(i915);
>+
>+        intel_dmc_wl_enable(i915);
> }
>=20
> /**
>--=20
>2.39.2
>
