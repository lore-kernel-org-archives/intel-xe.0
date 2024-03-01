Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1906C5478C
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 18:07:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9177010E743;
	Fri,  1 Mar 2024 18:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Udkejhmx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632D610E743
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Mar 2024 18:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709316427; x=1740852427;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C8pS7oqdLXj15NacMtLDv9sopEjr6NZ5r0ypj0F/tQg=;
 b=UdkejhmxSq0h64GAGYTWpVotyM/DAJbjujauPEyOau351K/ScTtvCNaX
 S+7TbofbPBDaTVlzsWK2uM1cVzcwUXjOL2KV/Hbgsw8lEyCv1lBahxuAO
 c5F4zjQIrJWkC2cqAADHn4xN6lB89nXPe5VCc9Lasqo5ARM2TquTjR6X7
 wr7hSZrJ87y4ntH4EB8mQI4NIV4wEpZrAgLmAP3kLfmwB9LwimEcaJXFc
 gwvO/Wa7y29aKZSfwTPTP+Qo5j2ZVgByxEiibmVDoHiIBk2nqAAVaoARZ
 38XyDgQeKQ/ErBCF3hx2E3XlTJbF3AoJKh72XubK7DK5HqxNesZPXVJpu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="14444551"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; d="scan'208";a="14444551"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 10:07:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8173828"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Mar 2024 10:07:04 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 10:07:04 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 10:07:04 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 1 Mar 2024 10:07:04 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 1 Mar 2024 10:07:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUALCHhMOF9RAe+80WUwreZT53paI/mzAPYrg18bVUS3NhQmEEI+AIoqumsE1kW3ZPWBJ5QPR55c/RfVaot3cOFZI+r5pntsrbWq+/y1WlA0rPUeaFob2XCPRF+V6rmc2PVOQL/89C/T5NfZgyVdtDxSC2AG/zdZIFgcJb79r3Oz4apRgbZvlXin1QV0Ykdh7e/oPntdksCJXpZlIoYXU9eFsJvBmQ/ByDhENXt5AyxPSpJ/Sm3Q+hlecvCncigvVbHiwr3sQEpBnfT6MxuH+8LE26h0sZXLL9OIGyyc1Mya9tW81w0QKfvwpC4nW4TZOY5rAhAP6D+JC7uivrA07g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvRUOwv7yBt0ypg+jo6UI2uYi2fyS1WF4U4eeaUik3Q=;
 b=QDwtIBo3IfgRVyK/0r4j3BeH+fn7B5OmiETGnrIfnCWhLDVrl8M4eXWge5EH2COs2hQ1xMKgaRvLx7KXO+fABMz4t1Diwr3I3R9lHB3VLxcs8cler3RmMgYy6aQcQlSmsQFCEAt1uRUEWEcRJocTqm7g2rkqbC+SfXE1pL2D27ktdZh52wzKtWFRirGHRo485dPZBbHpmAXsWBYbvNAex3GjBoZAqOuHEvbc4xnU7Y90LFnKuruCc3pBvYJmv/K7JrsHpTLf8Uq2E4s5kYos1vDrRs/aUOAGlQU+uDxwHpABVTirgemFK7hs7WMs6weZDtB4vqTL8Qk9NHzqWy0QGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.12; Fri, 1 Mar
 2024 18:07:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.024; Fri, 1 Mar 2024
 18:07:00 +0000
Date: Fri, 1 Mar 2024 13:06:57 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Convert xe_pm_runtime_{get,put} to void and
 protect from recursion
Message-ID: <ZeIZQTZB7X0CusQB@intel.com>
References: <20240227183533.505053-1-rodrigo.vivi@intel.com>
 <c64bab22-516e-4a9a-a3bf-e08dcef536e0@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c64bab22-516e-4a9a-a3bf-e08dcef536e0@intel.com>
X-ClientProxiedBy: SJ0PR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:a03:333::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB5900:EE_
X-MS-Office365-Filtering-Correlation-Id: a58ff97c-0a36-4d35-c413-08dc3a1a6441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jhSSFy1dVAgJSMEzpDBQvtZWpRjf+0S/upCydMv9DPud/7vTXnPuR8a4siG0/VMdVCVxMjU4ktxbxDCo4iMydUwvzsTKrGxBB2D1dLxkNY1AD/Pa1X7PY40/uqhBIc9sFMKa9XwP6xih8zCwGsErskidfyS0T/6r5aovA8iQP3plDdjv7RrV9JCYTrE8OXsanye1aWbFaVQtphlNYzyhkIcxHyzcgcaUHlyPhdJ7bZXawiKODGEW6DuVvY4XGoNDB60ruDcOdIhM4i9a4wJPuvIirRcxaPDTlYuXejIrO2CFIBtFcZR9dkVDCD+xolVbbCU0tJoGYEBWVgje3h6PYc0OzWHVzxoqi6OryKEFUmy6b+eiGvFvg9D/zP6P77yphTMnFIaMcq99amFG5mLxkJazllc+o91cLCPxB356s41B8B4hhsJVHZ7p2zh/QCq8Sovoa/jMLMB2LKcQXizjChfCaKvJesHJItU9iLlqOuPcy8IZ8S5wfXMH+Yo3wBUcPsO8vo9puhkR2YC/nFhwxXnE8Dq25j+yXoWWDX9HibBOk+U+AxqRQ0Pz3EDQP2ssocQigiOLly/ihxf6qWh8ZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wfwhbLX3qN/80zuUBrLWw/0DFn6aAKmESbZkFPfOx8C0exdabMjVQVYHwb9u?=
 =?us-ascii?Q?s12PgNTKdAtQQK0OEHmoZ/zVgnsVdLVcTB5BIilCGETE9Sl+4sg90b81gAhM?=
 =?us-ascii?Q?Ba39qXUAdQAD9O9xqUemcl73pteymq+AxeeB8oRPqUMrXf9yUFwAh7/YNN3M?=
 =?us-ascii?Q?nXBXVNjiZ+x+pQFsHT104n5Y0DVqy/nSSgBzQkHXuvaML6AlTlsL4z7WGPwB?=
 =?us-ascii?Q?aPfXonyCAZcl5VntbZD304u+lS4bUsTf8yFt82NX/J2rOalZVt+rJD4kYCCW?=
 =?us-ascii?Q?QXh4T420diG+G9BehjVVGFzReFuddHqjIU/IcKlDh+QUUPucQyC7YsrecpjJ?=
 =?us-ascii?Q?3FDyLMUSqvep/NQck914S+iXn/UlxDKKGkWQaspv6xO22Xr9D+kWKVLX983O?=
 =?us-ascii?Q?+5PqFdI92p88n6hIDZO8U4GdAERCGzSVkc3/BQcG8ifQI3y0MCQRipEUpq+J?=
 =?us-ascii?Q?J72ZrrOtQAeCYMED+4XWtW2eihV02LRYJLQA/MlS/dAIanBN422SmXqdfyn2?=
 =?us-ascii?Q?7Sh75VlwCj4PhO6XwrCa+9UxEFNsMdiHE6IrSHE7XXL41df7mTXFTyaiOZHi?=
 =?us-ascii?Q?tM9x9epoJSxlc2gWIybBJ4Stsk78p4pSPkPWy1tCkWezqAzqpcQp/iooeJh7?=
 =?us-ascii?Q?on8PWKPS8+9v6HVCjN3r4+AS1YviRBywGPzVryl+CpcTMdYCFLUE5k4rq45S?=
 =?us-ascii?Q?qFTH9TouGPyJm+Wvml/DN9sw4ZO9vStXcN4cvpgGpv4RykF7O4RZ1oxTY69g?=
 =?us-ascii?Q?BpOLNy+jGtJwoEpek5fbqwYxdCsNPuIds9luUwu56voUm/4iXaqgWav2F+rq?=
 =?us-ascii?Q?GohEFbk7zo82toSIDuTEdrEKCtf2mp/TbscHloFFuV0uZSecKudkLJqSH0tB?=
 =?us-ascii?Q?Wn8OXda/1FrVjikBiV3YPDaHsoAqQsNsWcDFVWS4/mSFJ+1Hydlvf6G2Vo5s?=
 =?us-ascii?Q?TKaGq6K1dkkI454owBPDZ1iLi7WGN+H5kj/AjtzK4qu2nutK4Syc2Yomgeos?=
 =?us-ascii?Q?qfOR8eTjdjLuT5hBRS5WinSa6aDkMywSjAamFQDx7Jftvp7BoPK+VZSMUmGw?=
 =?us-ascii?Q?kKTEpFNdlQ77VI4m/5R0PtXKhcwYkKoAmKbnOXnFOQ4ZZebYsAkpYkfRc3wM?=
 =?us-ascii?Q?GQefX/5fLOefMU7OIGq8kIROQ/eS99vt/n8xsj0tP6h92Lz8xzjfIUcN+t6A?=
 =?us-ascii?Q?ioKeDMBWoUf7kqWZRIj9EYar5hvpla//f2xbRJJNVcov6uoX8d80u3a4sFa9?=
 =?us-ascii?Q?Soj+nEIcZHud36ncoBqwaWivmlSQERXk6zit75OztP/PEQS+lfOIZoktL9ol?=
 =?us-ascii?Q?mbpy1qwIg2ocFFBw3m+/rBnaxgoeSqKIDoegTvPm9qY1i0S0W7eOPONAy75j?=
 =?us-ascii?Q?SMXpr5R61erirWY2T1hh6dT9CkUkZQDcxx+WTuZLzXlpTo+QOTgyELqKBmYl?=
 =?us-ascii?Q?Xt2JrULjnutuBiar8//v42KpcAPjAme4Fg15P3T0XWR0UTRVAk+O3/p3Br9c?=
 =?us-ascii?Q?fZssEAvuM/Qt9cfhb6oifABzfWQREJFaaQtoEsozTYQCsMLQSsWJ7PHIl5Pu?=
 =?us-ascii?Q?ykjkvfSdRIthc3rspltF3xgJ1AnF2zc7jM+aVPAm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a58ff97c-0a36-4d35-c413-08dc3a1a6441
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 18:07:00.7356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJsJF74Z9if/5KdMdRYVb/kYVeKNDr8LKCItVAFE+m74fiBiy7aKxXtna1PqhBLijgOUAgdYf1Pq5lrfZCL3pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5900
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

On Fri, Mar 01, 2024 at 05:52:02PM +0000, Matthew Auld wrote:
> On 27/02/2024 18:35, Rodrigo Vivi wrote:
> > With mem_access going away and pm_runtime getting called instead,
> > we need to protect these against recursions.
> > 
> > For D3cold, the TTM migration helpers will call for the job execution.
> > Jobs execution will be protected by direct runtime_pm calls, but they
> > cannot be called again if we are already at a runtime suspend/resume
> > transaction when evicting/restoring memory for D3Cold. So, we will check
> > for the xe_pm_read_callback_task.
> > 
> > The put is asynchronous so there's no need to block it. However, for a
> > proper balance, we need to ensure that the references are taken and
> > restored regardless of the flow. So, let's convert them all to void and
> > use some direct linux/pm_runtime functions.
> > 
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_pm.c | 25 ++++++++++++++-----------
> >   drivers/gpu/drm/xe/xe_pm.h |  4 ++--
> >   2 files changed, 16 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index b5511e3c3153..3664480b21ba 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -408,26 +408,29 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >   /**
> >    * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronously
> >    * @xe: xe device instance
> > - *
> > - * Returns: Any number greater than or equal to 0 for success, negative error
> > - * code otherwise.
> >    */
> > -int xe_pm_runtime_get(struct xe_device *xe)
> > +void xe_pm_runtime_get(struct xe_device *xe)
> 
> Actually there is still the caller in intel_runtime_pm_get() compat. What is
> the correct patch order here? It's kind of hard to follow.

Sorry for the conflicting parallel shot.
Put them together now: https://patchwork.freedesktop.org/series/130625/

I hope this makes sense now.

> 
> >   {
> > -	return pm_runtime_get_sync(xe->drm.dev);
> > +	pm_runtime_get_noresume(xe->drm.dev);
> > +
> > +	if (xe_pm_read_callback_task(xe) == current)
> > +		return;
> > +
> > +	pm_runtime_resume(xe->drm.dev);
> >   }
> >   /**
> >    * xe_pm_runtime_put - Put the runtime_pm reference back and mark as idle
> >    * @xe: xe device instance
> > - *
> > - * Returns: Any number greater than or equal to 0 for success, negative error
> > - * code otherwise.
> >    */
> > -int xe_pm_runtime_put(struct xe_device *xe)
> > +void xe_pm_runtime_put(struct xe_device *xe)
> >   {
> > -	pm_runtime_mark_last_busy(xe->drm.dev);
> > -	return pm_runtime_put(xe->drm.dev);
> > +	if (xe_pm_read_callback_task(xe) == current) {
> > +		pm_runtime_put_noidle(xe->drm.dev);
> > +	} else {
> > +		pm_runtime_mark_last_busy(xe->drm.dev);
> > +		pm_runtime_put(xe->drm.dev);
> > +	}
> >   }
> >   /**
> > diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> > index 7f5884babb29..fdc2a49c1a1f 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.h
> > +++ b/drivers/gpu/drm/xe/xe_pm.h
> > @@ -26,9 +26,9 @@ void xe_pm_runtime_fini(struct xe_device *xe);
> >   bool xe_pm_runtime_suspended(struct xe_device *xe);
> >   int xe_pm_runtime_suspend(struct xe_device *xe);
> >   int xe_pm_runtime_resume(struct xe_device *xe);
> > -int xe_pm_runtime_get(struct xe_device *xe);
> > +void xe_pm_runtime_get(struct xe_device *xe);
> >   int xe_pm_runtime_get_ioctl(struct xe_device *xe);
> > -int xe_pm_runtime_put(struct xe_device *xe);
> > +void xe_pm_runtime_put(struct xe_device *xe);
> >   int xe_pm_runtime_get_if_active(struct xe_device *xe);
> >   void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
> >   int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
