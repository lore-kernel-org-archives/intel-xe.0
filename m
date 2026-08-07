Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDFAC5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 11:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C5B10F48C;
	Fri,  7 Aug 2026 11:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzX/PFsT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7918D10F48C;
 Fri,  7 Aug 2026 11:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786103750; x=1817639750;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2agB/2mgnG4JLLNb/N7l1LTM8IP/xJeoVWw4Y0SusDU=;
 b=FzX/PFsTow4eU12n1tjW06gBesZZC7lqFvshyIaY4ktHycpSH5yR4Hg7
 FHh1jGRRKnFr2yqtdgdJgTnbvLd318pKXsZRtl2IGYdttS0d0u8p0kFxi
 lOpc1mpvvsC9PwXVZutVbmHx98DpPMLsQZyNgvG5Pcnk6Tok61eIge8+x
 K7zK2I66tlDCeZpohNnaWtDsOvE3UAom91P8SxwVoN06zAWwRK+tONXzP
 99Pp+EyzdMb3zylbD9nBqi88aMuzOgcDDtxLJSWXBbkDxHjidZ2qa41Yr
 HFpHbAKnQ+uYKv0JHGdrcqUydc+iSVGerwZIskho7WeiXVBM1iQoLQRkW w==;
X-CSE-ConnectionGUID: alLrNP8NT4KXGzIRbflrRQ==
X-CSE-MsgGUID: iToCWwQ2QUWo4ZM9QsKZlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86561366"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86561366"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 04:55:49 -0700
X-CSE-ConnectionGUID: G4B3LbrHTPaKLi2qlMhVWw==
X-CSE-MsgGUID: NA4ODDbFRdmD7InCvEnfHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="260606913"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 04:55:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 04:55:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 04:55:48 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 04:55:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDgP4Fw4UH18rGkBCFked/3xuksMrfenpzbwd+Ia9Buo7lfMjBLZrpPVC5XzyvrszfV/uUpFBY7DmnCldt7Q0TjFm0Fgfvq/aUC6Ko8pvjtvf9er8KgRyghjBu45sdrXRXINv+5RgpZqpUvRb55RHmeHMZikfuiiMAPI0omi8LJJPpMs7BGk3F6w4AYxDuP6bAtmPlpQnnHx43yKUoHF4o1HEVQA5O41WWvbbBLKJcUibu2i1my7xlhJMiTvJ59V5fC6KfNQvZgFVvuHsRB3U98gLokThZiqB8zfR8etlA1JR/F6rZXETVk8h9hiLeDZvIIRrnppu3hG1o8rBdvxRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcmzUIteDn3IkXfCQbBLjRRQSOJ9xS5PDrEsMHSFWzA=;
 b=f4sFjvcHE8XRXmSgG7fTZczDWYfcIE9EWN/e3V+EqUTFYAUSDYZIPHKDWEvYxD5SKikIGtd4DKlp2NMphffD/cJgx0Xo64LlkuI+I6N42ZBcm8RCVdPtkO0tLy7UU5/S7yYcUBdB9CRIAgkSuNx+11RxN0VF/0hsUndk/WM+QUKzynBjhPclLIfHtAw7NpC7EdRKM32EzLaTjViybTWQOHRm0Qv8OIiSoBkm3cImo7MVs5lXvSTefI29PJbnAFiahg+4wQEoUbas3CihDjfGckDVJyY6LHAWsL4H2707tVd6+qzBuzsEaudguyQ4KxpMKj5qvD6+cVUb7QtCk4DHPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Fri, 7 Aug
 2026 11:55:42 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0292.013; Fri, 7 Aug 2026
 11:55:41 +0000
Date: Fri, 7 Aug 2026 07:55:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>
CC: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Nemesa Garg
 <nemesa.garg@intel.com>
Subject: Re: [PATCH] drm/i915/dp_mst: Remove duplicate
 intel_pfit_compute_config() call
Message-ID: <anXHt7b02V4s-tQ1@intel.com>
References: <20260806074819.2631970-1-chaitanya.kumar.borah@intel.com>
 <aeb1e53100b0b28c557061a706fe2ffb04a662d5@intel.com>
 <anTmAUupVyP6fiA4@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <anTmAUupVyP6fiA4@intel.com>
X-ClientProxiedBy: SJ0PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:a03:331::17) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|MW4PR11MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: e0d2c597-bd65-4a7d-c29f-08def47acde0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: qKH/LZaLQc7mTT4aHc5+hwv7A70iPbDNVxcfTOP0lQg6/GqZy7dNzA/p4qjrSM2GVrp57y1LCqlGRXlhQmALGmLykXWTrQuWbZFS1ukNviwrPVVOrTqQDBlIrxYyTGZ5C7sKJFy1O1FT8eB9a+DpoOR94uiY+KvDF++R4jgisZ0YA0ChLN2Oq1adDjqeazsvkf+eCO+g21Wj0OtkQOEmJ41atiK3cALFTyR/7ElSp6Yu6GmmSpXT8KCl64rmlhix7GQwaxxS1tYLRfFQjYi63ZCGhM62KODve3fAL+LUgYrhvutRznwDRSUtJJJbTeuvfS+yi1zqRJTEwDe75urdGeHTXXbPPQxaw+wUFMsJI72xErsApbc9ztj1d+MNwOtX26tOoyxe2ycvlhswcCuQs2pMHb9KrYCkIOXMxzrTeW0nMHLEmthdTyvWU6O2NmORmhXw9WI3RHdn5ODSSGa6Ax3pbH+7o6hPY0wNXkgPkA1hSFQxSLr79gED4REL2j7+wkX+erEjBZ9STOk6ZJhhaBColurA7iTTKzVAdhmbRYRA9RWiUa4AxDpEyhHIl5dosIesyjEA+BkAMK4fn4t2Iog+Y1RE+ItiB0EcbDA8B4TWTmP5aRqPNn0o9l2NTzEY2lmArIjs+0IV+C32tKq7KwIzie416K1yQTnf06qiJxc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nxC4AtB3d+Q/TTSw1xwgkD0KVVM3QVRDIDHdEboo9nqbMgLr9d8zJTAool?=
 =?iso-8859-1?Q?5aVY0wS8rv1x4CHtLzbvd46iR3pQ/yu76AxuY2KDPTeBYtuGVUYyVtCL7W?=
 =?iso-8859-1?Q?fQ3o3uARckMAjH5vb5k2f3l8FoafRs54TOiXxvZ/NoN9WuyKYbiWfi55ON?=
 =?iso-8859-1?Q?X9evPtUe4gJlCJYdCfKxxuVBdSd6PHt/17xFs9c9su0X/FQb6mhrnsN4M8?=
 =?iso-8859-1?Q?uDYJFrtUJBRXBX9hermDsc4MB3BUIIW2bp7+eV1MsGD4fBqYkJhje19505?=
 =?iso-8859-1?Q?wbr/UA5N0D9zKI7pbcwhfo5FxzY2W4v2zH7J2sGUw9cZKtUWCkOIUHmdvC?=
 =?iso-8859-1?Q?ZPpU7omDJ7eVsZBlPIMxuxKY9FHteT5YmvVlBR2yt6c+cE0oolqonfhCr2?=
 =?iso-8859-1?Q?91Zw9DiM3HKD9XDXjz9Rt5czMG5H/9TXZsAffIFRbvw9lBlwpEsYv4T74E?=
 =?iso-8859-1?Q?CSQ4qqav3Owto6ip8zG4CVevbKB2WgV1aXDVG/oSGx+wCWgOFL/ItHZX0u?=
 =?iso-8859-1?Q?45AT2u7cXXfIMW7nKqNarw6hLu5YEV9cirTBwjBATCJm9alRQmN57orYcO?=
 =?iso-8859-1?Q?KCsYeXRMViNf8NHQSX+wL3u3WX5sNZY8V9F4Olb0neUHi1naF4ZrGsuZ6f?=
 =?iso-8859-1?Q?jtPG+ymZufwzjMRFsyFqOTH/mTTpxI29kSpliAL+u0ajMBr8KmJ82DD3+O?=
 =?iso-8859-1?Q?N5hcN0ygT4d/WqNkLcQGc4OnHH2bD4mFrtS0IaNNm4el3kstwudfJnNjbI?=
 =?iso-8859-1?Q?GMhMNjhbbZg7kdNYXso1DFyeHxh1xtlvzn4wGeiZYksCKUeGC7zsFWa2zg?=
 =?iso-8859-1?Q?PHkd0OAsPkaYlRc78airzptwV4asF7RiTEuIFKLOJ5lTDzpmtMBB+nC3t7?=
 =?iso-8859-1?Q?xPoTbqyL0WMWHYacnsZO+A6VM10RFqxMnQnvJ112AwrD1hTkXKg5fwwhfw?=
 =?iso-8859-1?Q?MCH7v7zHAPjBd+HH64tyDKgZDSdvbBbvpc7Wr/rkowZhs0N8bxm0LysJhi?=
 =?iso-8859-1?Q?j12I+3gRjBpHJ9qR58daCd/DplDeQ6nM7OhiR5RLQ8XWKnigdxBPZgdN6a?=
 =?iso-8859-1?Q?k8kNLXQSq3MelWD/TsWgjmPdosYa1kJrjF5fcVjQMdoCGvNmhMRZJwJeVA?=
 =?iso-8859-1?Q?MStaYm1RUjXGfUiyty0xhhFD3BGlUXjVQwmLOjA7VEkLnsHSUSOlwJAEEq?=
 =?iso-8859-1?Q?0Ka5w7QdtgQ+7YAESeHdeRk/Ff6kFNbUHfzehNX9OPkeUNFIZgLHdGmgiu?=
 =?iso-8859-1?Q?jv4htUncpyFvKxAioGAQpv3o59m3yacTpmweUjHhrD9oYYRIEqudSI+kHp?=
 =?iso-8859-1?Q?pV47zaSMv2kaWe2jByKEt4DWfz9KvNPJIZWjKky7vyktOvFjriKFR+hxjy?=
 =?iso-8859-1?Q?Hb5C7GP0s740alou3z/glFhRLPlC2VHh1vauwGFBVlyox0hla/Ro5OV49z?=
 =?iso-8859-1?Q?J+y/YBc6Gwq0wR2a8cVQFYmQsymijcEqjUzP8MNKVi+HNdXPyh/GT4Dk8Y?=
 =?iso-8859-1?Q?x7FOj5LLiXQwO9CF0L1av9Ibzfseg2EQlLv/oicedIaV0umJ5+muKkE/DS?=
 =?iso-8859-1?Q?6JnimI2utse9xY1UjtY4udu4ZaiP41fxNazDNsmHG1vlZzEG3j3gtOuWO2?=
 =?iso-8859-1?Q?q2TrFw0NdgvMt0Fmcowxv8eDC6Y4xnwPZaN5ge/ckU6pHIDZ5mn859Ls+V?=
 =?iso-8859-1?Q?Szt0ra+KH9iu/W3fvUu/dcRmbZur4W6RmhX9mPF+oK4ODWhkrYcJFZuqWU?=
 =?iso-8859-1?Q?dQPaG+0pibMyMLtKZrctIhTSQxR9su01GOeO2A5YxfbiAP/hK0nqm8UyDh?=
 =?iso-8859-1?Q?1XcCsBEG0w=3D=3D?=
X-Exchange-RoutingPolicyChecked: N0grtfQlCkytDbtadK2bg3qO+UI43q8YuiK94bMd/ijExDWLS/w18cPD1nttr5v2Yp0nB+QneWg0lkrJByg6iiS9p1BDRMOY6u2rQIJPcaSFg39QJIRMrfzcFgRPwvQsnuYunYFDQN31mQcgnTwtDUG4ScCZzAyd6gtpeX0zxIZrc4eT52CZNz/SfxuUeCa1SdtimxrL6YFjqMGHdN3Oi61XHg8qogHhvSuA6hh8Rbu0kwkrSA/AFqUaFdVatjsHgqq1QXNnrUC31e8g02hCll5Hshw+Zn5fQ9umbLtx37toTeah9FQ0sml1fhmA/339haFGLKryAOWVFkjjf/H7Rg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d2c597-bd65-4a7d-c29f-08def47acde0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 11:55:41.2891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ppl+no+Sq9kzC3i0Gjv2WbogUB5GbnAsIxzQtNfx7zbnh9dNV14qhrpKTtESWbcHaK5viJ1EnD/+jhFVzDRpNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6864
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

On Thu, Aug 06, 2026 at 03:52:33PM -0400, Rodrigo Vivi wrote:
> On Thu, Aug 06, 2026 at 12:30:16PM +0300, Jani Nikula wrote:
> > On Thu, 06 Aug 2026, Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com> wrote:
> > > mst_stream_compute_config() called intel_pfit_compute_config() twice
> > > in a row. Probably because of a bad merge. Drop the redundant duplicate
> > > call.
> > >
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > Cc: Nemesa Garg <nemesa.garg@intel.com>
> > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > Fixes: 5ce9ac1531b8 ("drm/i915/mst: Call intel_pfit_compute_config() for sharpness filter")
> > 
> > Rodrigo, by the looks of it, this was an unnecessary cherry-pick for
> > fixes. The context for 5ce9ac1531b8 shows the existing call, so I don't
> > think this is a merge failure. But why it happened, no idea!
> 
> Indeed weird, I should had caught that on the fixes, I'm sorry.
> 
> but it is weird anyway, looking to
> d4686f34bbeb ("drm/i915/pfit: Call intel_pfit_compute_config() unconditionally on (e)DP/HDMI")
> 
> which is the mentioned fixed patch, it actually introduces this chunck.
> Then the fix patch introduces this again.
> 
> So, it looks like this also occurred on the drm-intel-next first anyway?

I'm sorry, I got confused by intel_dp.c vs intel_dp_mst.c.

The thing is that 

5ce9ac1531b8 ("drm/i915/mst: Call intel_pfit_compute_config() for sharpness filter")

should never had been cherry-picked because

ca97f5546f19 ("drm/i915/mst: Call intel_pfit_compute_config() for sharpness filter")

was already in the same tree.

git didn't notice it and move forward with the cherry-pick
dim couldn't have possibly noticed it and proceeded

I failed to review and notice the duplication. I'm sorry about that.

and the duplication then propagated to all the branches...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

for this patch here....
I pushing it right away to drm-intel-next.

> 
> Ville, thoughts?
> 
> > 
> > BR,
> > Jani.
> > 
> > 
> > > Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_dp_mst.c | 4 ----
> > >  1 file changed, 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > index 3be1643f8d03..57daed0b0b36 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > @@ -761,10 +761,6 @@ static int mst_stream_compute_config(struct intel_atomic_state *state,
> > >  	pipe_config->sink_format = INTEL_OUTPUT_FORMAT_RGB;
> > >  	pipe_config->output_format = INTEL_OUTPUT_FORMAT_RGB;
> > >  
> > > -	ret = intel_pfit_compute_config(pipe_config, conn_state);
> > > -	if (ret)
> > > -		return ret;
> > > -
> > >  	ret = intel_pfit_compute_config(pipe_config, conn_state);
> > >  	if (ret)
> > >  		return ret;
> > 
> > -- 
> > Jani Nikula, Intel
