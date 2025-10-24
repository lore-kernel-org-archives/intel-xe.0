Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EF5CCF9E0
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 16:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EEA10EAD3;
	Fri, 24 Oct 2025 16:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="brxhkIml";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8346110EAD3
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761322216; x=1792858216;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9tEt3/EoYZ124GBcWruQR/ISjlM3B99usrpfMG+kyZg=;
 b=brxhkImlaxwZQUIPlWZMImmProx2sue12CDgWigQv6khlfE5KfQH72Xg
 t0CLEL/5RVyEwnlXfNokfd6i6Da8GwnZh3X8hdQ0OOV2aG6JZkYQsK7nM
 KeWNQyElq8Zc0gC/G9EfnJjB4od53xnxa4uMwv1eXq13fFKHQmlVrJyh2
 bIxWWNeIFnadOi9yo2tQ/PxRMr9Qyue43AAz8E+RXM5NfCHpRu0a48vck
 UdO3jusnk8duYIIlcCt02tcGoy8qn/9exkd7tngTLTptHx6ChPCQBcKIm
 5ogKIAHRGv4I1OKhzPbbY0oW989xodUjMeyMccGTvJsbZwfACDaF29P7Z A==;
X-CSE-ConnectionGUID: iHvtJj8gTkWKWOeHAKJknA==
X-CSE-MsgGUID: 7JpWyJiASai1Ugb6RtniXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62714577"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="62714577"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 09:10:16 -0700
X-CSE-ConnectionGUID: Owh933O6Tn6hV7hpgkSIQQ==
X-CSE-MsgGUID: hD7X0XAoRGmd4hUGaWr/ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="215119659"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 09:10:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 09:10:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 09:10:15 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.33) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 09:10:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4U9V4sF/MBPxOA26qdgcpHuoNYfREPeoniFIpxPJpo3pBU5AiV6/8Vdu+0qU7ZZOP2DNoowICbgIa3OuL7iquVass6CmwaIZ/tFR+cRAlFlAu+N5ZaOkhcLEYOuFY+6Tj4LdZBKaL6HIpTOD/d5ljompeLf3hFftVl8hFp0QfB8IihjAA4Ti6S1o02cBBHgyNYxfZh0aBMUgxRJlSvJ78R9OTqEjXN6lTsdRz2J1sMM0wo2u/DjZvEkbsoNGWe8+V8ZpfxMhGxs7EGu0bhMM1lVo+W2cXA7JqW4WjOEDmDIlfuFuUjiKRP+5t+SAai/4ooo7kb/5YTWvX1ugV90Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nq8exFKnNRtTHGjMM/fSFApRGrZNr2R6SVdrJbXDo80=;
 b=UMcSDno1LomQS07SJp9qlMV8UmtW3Mx62zNFM4pt7fyVmEG3uTSbtWk9L+XDEkJkJtBQe/BXwMXeFucaEwYEIo91lEZ/KROlWboJ+J1XFxH+NyT36T9vdBra8Gs3eeFzDXyN7KkRw56MmZxfyDxbR0+qcPbwEw/V7SEdFfybr5hOoSnCgdVqsKLPWx/9KxrWFBB3zRQmJRQGLWQWIU2ybutYiTs/JVdu/7iM5JCAO1uzlpIvLnrY5CnuV1V9WOFKfLVrZJTfI9DqO0axS3FCCrJPGmqAh6GrKpk0nRR0Sm4bqKSWtfnGnxdQv4gEWajyDtly+BmLwPAg4tGyVwPp4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB8149.namprd11.prod.outlook.com (2603:10b6:208:447::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 16:10:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 16:10:12 +0000
Date: Fri, 24 Oct 2025 09:10:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v8 1/3] drm/xe/migrate: Use AVX instructions to prevent
 partial writes during VF migration CCS batch buffer updates
Message-ID: <aPuk4a/S+JUS6Zy4@lstrano-desk.jf.intel.com>
References: <20251024133522.16970-5-satyanarayana.k.v.p@intel.com>
 <20251024133522.16970-6-satyanarayana.k.v.p@intel.com>
 <aPuFuykBdiwM41Z2@intel.com> <aPuHjlbbeJq8FpWr@intel.com>
 <670ce0ec-ce9c-4003-afc8-8e508e41564a@intel.com>
 <20251024160512.GB5409@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251024160512.GB5409@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0190.namprd04.prod.outlook.com
 (2603:10b6:303:86::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB8149:EE_
X-MS-Office365-Filtering-Correlation-Id: b1be3d8d-d370-49d9-f2f5-08de1317cfb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9OuyCXLh0j4OJSxuXTXnTUr/mHOt5ctQcZRra8FV6a5lLfLLQ70EzpsBwW?=
 =?iso-8859-1?Q?9XbI7Iy60/pTmTuVP1tnsmVO9EEWMRncOSdkesvr8DHqa6FQ4LeFPIHIVE?=
 =?iso-8859-1?Q?uMW3h9jwkXuf/7LnU2HDfmBs4rFO9r9o7nuPXPD52lNuIeX6svajNOFPzo?=
 =?iso-8859-1?Q?ztprASNo9e/HBLVLMRVaV26wzuVYtFZOwi6N63HFULSSndjh9DKX+EopPF?=
 =?iso-8859-1?Q?+yvJGObCWGxqXcNi4TTnvhMUBJBQdicFn+3nlBZQbDevywpsEyPAuD3K2z?=
 =?iso-8859-1?Q?gySiROJHbvGLNTcd7syrHGWf2mplqOYTQa+F4evBZy0zWrJLcgBNYiAthJ?=
 =?iso-8859-1?Q?wUh/CJ2qcDeY6Fq5H+feCCGM2mQrJI8b18yDW4M8Ts31TAYfXPom4166XE?=
 =?iso-8859-1?Q?tyMMdTwNIaJncGH3FCqjj3TLJtfiVl15KVoEeh1g37rF9tKesnF6TC/+vt?=
 =?iso-8859-1?Q?6rnbj7Zj45EipHzFBDb31EHsY1S5EgevvXPiJ+Qg3wPprgFutGVv2jgQbE?=
 =?iso-8859-1?Q?R4EzU3lhZ3T76lAObsl3S60DJ0bwmcQ/yAMqXGdUmRz0Pr5yY+ZahmZoGz?=
 =?iso-8859-1?Q?V6dZywtUh0Bo+LCsiDgyNnh5uxXja3m5QjPIUDvi0gxZX3IWBAPTYxtp6V?=
 =?iso-8859-1?Q?6Wqy1xFWKs+L9Km1gAJ3nWlGIflSFEuFS+EAsy0rjX6v4cRoO9zsN02OFD?=
 =?iso-8859-1?Q?NgVn9zQhMDGWvoOqyx2IAP4AeBWV+UJmfPT+v5f/Uoqpc1nsPrUuOTBfRJ?=
 =?iso-8859-1?Q?65tmfrWBrc+KThmntd5rigjit1UZKKQV4IgjGHFNFOPgzy/Tv7n4Zb6BnO?=
 =?iso-8859-1?Q?V+27L82TW+mDG/3BJ3HW7XZXE48NK2MWGUfpAQJC4Ql3QEtmxtvGR0RZl7?=
 =?iso-8859-1?Q?3i64pWfN0Ret3WYyf7+gcMwuQk13nI9/CKrT0Qsr///QgfNS280WiwQpC4?=
 =?iso-8859-1?Q?50d57apLIVSxl6w3hGyMA4uP/NfLKkVabn/BT3kxlWjBDvkKWL06k+AJg+?=
 =?iso-8859-1?Q?QT0Nt5D1owaEHFOFfV/niUfxhFTFXfAeb+YKI8sdHxyQYFLx9Ie6wO9TjP?=
 =?iso-8859-1?Q?HrfCEOsUjT8OiIPdUwXJiao+5M499rQ8ZOYMzwphB5kew+wxumy8AQes2R?=
 =?iso-8859-1?Q?ee72yH4x558jIij8tGm10SZsND9SqKBxNju0u+v66QN8sSc7WnNHNBC07o?=
 =?iso-8859-1?Q?EwWENHiRztIy1Pk7zp/hn4rK2KS55vn1DsPwDktS6cUMhfDsFORIUd0vV5?=
 =?iso-8859-1?Q?pz2vjSJQWWPHs40O3kA9f8k9qbafeXhw182Zv67cMD3Yqo4+p8RY6gihAQ?=
 =?iso-8859-1?Q?2YLr/x0ilkAHxEH0z8l6yyLLqAZ1L0RcliqOHI325aiEA9AT7mXzkVekiF?=
 =?iso-8859-1?Q?71Te/N3c/Vs7c365TQZAKyEwzXRlC/ojdJEbxLRR08GTFkxWOvwQFKQ2hP?=
 =?iso-8859-1?Q?zzmme9lmu5Ln5zLXKuxb6OtUPGoK1JB+ufG0WW+Sm3eseg0Pd1tCs2SuCV?=
 =?iso-8859-1?Q?NBVvQ36Tt9S6Vk+NfP4f7r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tdEhyMKck2741Z585VijUZlJrIow/eMBVjm7h0v0+44hxaPuhPKB9GesNy?=
 =?iso-8859-1?Q?2yKVyeEzOho8IO9+CsFmByHp08FWhNMN12u8Oh7d5qpLrPhT1nxE9OMA3S?=
 =?iso-8859-1?Q?wIx4e5Hl2I3MQ23gocX+eWp0G6VlWGFKm67mRei3Ql/K0tw1vFSedkEuSi?=
 =?iso-8859-1?Q?L0pNW+kAqgzsWUcwGEK6tihmKtKZeqiWNaH9DQcYknInffvSTPdp0fFX8C?=
 =?iso-8859-1?Q?UIk92qZWEsVAf99JtUUvzWVq4e03QovvgP8O6ImI2cU9bLSaHJlFgPq5ct?=
 =?iso-8859-1?Q?K7HRTO2vUEk+T/pTAAc62twvA52lLPr9HI53jIR5xRLoT258yJa6smsa7t?=
 =?iso-8859-1?Q?3kRei/e+B0tYUBmTAqItblt8hvV+1zLHlYXgJOyw4ZvCU+etic6GQHG43S?=
 =?iso-8859-1?Q?tozgQxNAqsijUW6hhPdvxokmoT6V3xO/Jl2OXtPrdfqd27+UGKvyq+BL/T?=
 =?iso-8859-1?Q?PTsk1vxAoX0OMpfr88Ab1JMqpXGKIH8sy1mLnIdAoP4biCAeuXlFpe7q2l?=
 =?iso-8859-1?Q?2qxygKD0zA0kxkU+Z5n+Xt14zNOKE8bJJIS7tzBNnSPZA7Cgb+IEPTJ/2n?=
 =?iso-8859-1?Q?drtqRq/SnrA8LRtxERCQ8MuO0AnhP6pwl94+eRYKzIl7dwkJESUVr818BI?=
 =?iso-8859-1?Q?gUX85MXWcw2PY7pTXAUt7wsp5Wb5G7jHSM6IK9hfL/9GHwqp1Uz6F77id3?=
 =?iso-8859-1?Q?atfXmYuEt3e/ACUvK0U6YGaj5ka60DYtJS070Ly8bwYIxU2KikBHstSdMG?=
 =?iso-8859-1?Q?d6uaTN9O7GBRFRHswVzZPkYvEvShl8yR5LerftO5wJ+2WDyL/7V6SAwmoz?=
 =?iso-8859-1?Q?8xL6jxOvMXMbz/FyiTBgHuC5ZnfzFLLf4QuBvmQTCXo8lzq2PLLkKrQSCy?=
 =?iso-8859-1?Q?2iQ+/vDoUnJNVMGyQoUotIWRc1xPcg2mrK9KkvwOTvVgLPj+G7Yt+U08dd?=
 =?iso-8859-1?Q?YzjNC+dWCNpt227GF2HXEWs4aroUmp/gvT2jLUAJ27qFciYe3oKBUhOk+T?=
 =?iso-8859-1?Q?F//dP4y7uH2Vtu1GcIkuYf37mNltMDvd+MqaJfZXiIMlfMDgbTnUSI2lhR?=
 =?iso-8859-1?Q?XW0X0E6p2hv5dsYuWWGFWJ6KakDdlzrueyHD3m6bvoF3ex81+IlEyEyF7y?=
 =?iso-8859-1?Q?/BGm74kUDfkdvpmQyITOM1hfM/xsTcl5qqny2CLF5u2NwUxO9lh4qYVXWz?=
 =?iso-8859-1?Q?XtHa90XyMejOBZhiRFusvxNeS9KFGlcB1jjqmcGSRFjgYLmkPkzv9U3umN?=
 =?iso-8859-1?Q?hjc3GX2dfJ4O86UpCskTrBmoTYp1ZJ80iJClTuNqTcj7asQv7Fn7PN+pSI?=
 =?iso-8859-1?Q?2fotFjkynGjA4eY1X2wUcgnn92qn0UBREY1aVz0YCkiRjMuP9yostsURja?=
 =?iso-8859-1?Q?omZmMSbTb1pgfdw7rWd8MXlDQZB4E7vQJbvdKUnB7m0NzpUNz6fUjsHkxq?=
 =?iso-8859-1?Q?Ws3sSoxtTXRNbRnp6hJ2YwDO55SFzwMvScrMtsG1QQ1XC5ZlMiZcZCgAOE?=
 =?iso-8859-1?Q?KTHvVdr6vCoNIxyAugVRi2OCalZXGp9EKqV2BfJNuUynbQ97fUzPoRfhgq?=
 =?iso-8859-1?Q?T5zs+R9vVfRiw+CDYpkwwFPn/PlQ92YuUGU+n0Er40aOvaMMAPcocZbBSt?=
 =?iso-8859-1?Q?In9n6VlcZcjQvOesluRJNzmk2aSvq8f1GWmIKf+WFVZ+dWmlFYEejrfg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1be3d8d-d370-49d9-f2f5-08de1317cfb5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 16:10:12.4780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zcQ7WkR4hyudlP+xL3xI/WAqoUVdzrEJLqoYDyUouFtVyHKWpor7bfYfQFpv+nHji0pi53FA3IiYH9eL0VIeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8149
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

On Fri, Oct 24, 2025 at 09:05:12AM -0700, Matt Roper wrote:
> On Fri, Oct 24, 2025 at 07:55:32PM +0530, K V P, Satyanarayana wrote:
> > 
> > 
> > On 24-10-2025 19:35, Ville Syrjälä wrote:
> > > On Fri, Oct 24, 2025 at 09:57:15AM -0400, Rodrigo Vivi wrote:
> > > > On Fri, Oct 24, 2025 at 07:05:24PM +0530, Satyanarayana K V P wrote:
> > > > 
> > > > Hi Satya,
> > > > 
> > > > First of all, thank you for the updates.
> > > > 
> > > > Second, the subject is way to big.
> > > > 
> > > > This should be enough and under 75 cols:
> > > > 
> > > > drm/xe: Use AVX instructions to prevent partial writes during VF pause
> > > > 
> > > > more below:
> > > > 
> > > > > VF KMD registers two specialized contexts with the GUC for migration
> > > > > operations. Save context contain copy commands and PTEs to transfer CCS
> > > > > metadata from GPU pools to system memory and restore context contain copy
> > > > > commands and PTEs to transfer CCS metadata from system memory back to CCS
> > > > > pools. GUC submits these contexts to HW during VF migration.
> > > > > 
> > > > > Each context uses a large batch buffer allocated via sub-allocator,
> > > > > pre-filled with MI_NOOPs and terminated with MI_BATCH_BUFFER_END. During
> > > > > BO lifecycle management, segments are dynamically allocated from this
> > > > > buffer and populated with PTEs and copy commands for active BOs, then reset
> > > > > to MI_NOOPs when BOs are destroyed.
> > > > > 
> > > > > The CCS copy operation requires a 5-dword command sequence to be written
> > > > > to the batch buffer. During VF migration save/restore operations, if the
> > > > > vCPU gets preempted or halted while this command sequence is being
> > > > > programmed, partial writes can occur. These partial writes create
> > > > > incomplete GPU instructions in the batch buffer, which trigger page faults
> > > > > when the GUC submits the batch buffer to hardware for CCS metadata
> > > > > operations.
> > > > 
> > > > Perhaps we could summarize the thing here and move details to the comment
> > > > near the assembly. The important part in the commit message is to have
> > > > the 'why'. Some of the details of the commands like MI_NOOP fill and all
> > > > could be in the comment near the ASM.
> > > > 
> > > > > 
> > > > > Standard memory operations like memcpy() are preemptible, meaning the CPU
> > > > > scheduler can interrupt execution midway through writing the command
> > > > > sequence, leaving the batch buffer in an inconsistent state with partially
> > > > > written GPU instructions.
> > > > > 
> > > > > Replace standard memory operations with x86 AVX instructions that provide
> > > > > atomic, non-preemptible writes as AVX instructions cannot be preempted
> > > > > during execution, ensuring complete command sequences are written
> > > > > atomically to the batch buffer.
> > > > > 
> > > > > Expand EMIT_COPY_CCS_DW from 5 dwords to 8 dwords to align with 256-bit
> > > > > VMOVDQU operations. Update emit_flush_invalidate() to use VMOVDQU
> > > > > operating with 128-bit chunks. By ensuring GPU instruction headers
> > > > > (3-dword and 5-dword sequences) are written atomically, we prevent partial
> > > > > updates that could compromise migration stability.
> > > > > 
> > > > > This approach guarantees that batch buffer updates are completed entirely
> > > > > or not at all, eliminating the page fault scenarios during VF migration
> > > > > operations regardless of vCPU scheduling behavior.
> > > > > 
> > > > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > 
> > > > > ---
> > > > > V7 -> V8:
> > > > > - Updated commit title and message.
> > > > > 
> > > > > V6 -> V7:
> > > > > - Added description explaining why to use assembly instructions for
> > > > > atomicity.
> > > > > - Assert if DGFX tries to use memcpy_vmovdqu(). (Rodrigo)
> > > > > - Include <asm/cpufeature.h> though checkpatch complains. With
> > > > > <linux/cpufeature.h> KUnit is throwing errors.
> > > > > 
> > > > > V5 -> V6:
> > > > > - Fixed review comments (Rodrigo)
> > > > > 
> > > > > V4 -> V5:
> > > > > - Fixed review comments. (Matt B)
> > > > > 
> > > > > V3 -> V4:
> > > > > - Fixed review comments. (Wajdeczko)
> > > > > - Fix issues reported by patchworks.
> > > > > 
> > > > > V2 -> V3:
> > > > > - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> > > > > - Updated emit_flush_invalidate() to use vmovdqu instruction.
> > > > > 
> > > > > V1 -> V2:
> > > > > - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
> > > > >    (Auld, Matthew)
> > > > > - Fix issues reported by patchworks.
> > > > > ---
> > > > >   drivers/gpu/drm/xe/xe_migrate.c | 114 ++++++++++++++++++++++++++------
> > > > >   1 file changed, 93 insertions(+), 21 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > index 921c9c1ea41f..005dc26a0393 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > @@ -5,6 +5,8 @@
> > > > >   #include "xe_migrate.h"
> > > > > +#include <asm/fpu/api.h>
> > > > > +#include <asm/cpufeature.h>
> > > > >   #include <linux/bitfield.h>
> > > > >   #include <linux/sizes.h>
> > > > > @@ -33,6 +35,7 @@
> > > > >   #include "xe_res_cursor.h"
> > > > >   #include "xe_sa.h"
> > > > >   #include "xe_sched_job.h"
> > > > > +#include "xe_sriov_vf_ccs.h"
> > > > >   #include "xe_sync.h"
> > > > >   #include "xe_trace_bo.h"
> > > > >   #include "xe_validation.h"
> > > > > @@ -657,18 +660,70 @@ static void emit_pte(struct xe_migrate *m,
> > > > >   	}
> > > > >   }
> > > > > -#define EMIT_COPY_CCS_DW 5
> > > > > +/*
> > > > > + * VF KMD registers two special LRCs with the GuC to handle save/restore
> > > > > + * operations for CCS metadata on IGPU. GUC executes these LRCAs during
> > > > > + * VF state/restore operations.
> > > > > + *
> > > > > + * Each LRC contains a batch buffer pool that GuC submits to hardware during
> > > > > + * VF state save/restore operations. Since these operations can occur
> > > > > + * asynchronously at any time, we must ensure GPU instructions in the batch
> > > > > + * buffer are written atomically to prevent corruption from incomplete writes.
> > > > > + *
> > > > > + * To guarantee atomic instruction writes, we use x86 SIMD instructions
> > > > 
> > > > Here you still mention 'atomic' since we already know this is not 'atomic'.
> > > 
> > > I still don't see how is this supposed to do anything useful without
> > > atomic writes to memory.
> > > 
> > > If the GPU is executing the same memory we're writing then nothing
> > > short of atomic memory writes is going to actually fix it. And even
> > > that would require careful alignment of things to guarantee that
> > > each command is completely contained within one atomic write.
> > > 
> > The CPU and GPU operate on the same memory space but at different times
> > during VF migration. The critical issue occurs during the batch buffer
> > preparation phase when the vCPU is still active and writing GPU
> > instructions, while the GPU will later execute these same instructions after
> > the vCPU is paused.
> > 
> > During batch buffer updates, if the vCPU gets preempted while writing GPU
> > instruction sequences (such as the 5-dword CCS copy command), it leaves
> > partially written instructions in memory. When the GPU later executes the
> > batch buffer after vCPU suspension, these incomplete instructions cause
> > execution failures and page faults.
> 
> As was discussed on the previous revision, the architecture document
> already gives guidance on approaches to deal with these timing issues;
> using AVX like this is not what was recommended.  Can't we just
> implement the shadow buffer and eliminate this controversial and
> confusing assembly usage?  I think relying on assembly should be the
> absolute last resort and not something we jump to when we have cleaner
> and more widely-supported options.
> 

I discussed this Rodrigo on call, we were both fine with this solution
but if the consensus if not use asm, not sure we can pivot. fwiw, this
solution will perform better as there is a non-zero cost of maintaining
2 buffers but perhaps that doesn't really matter as I wouldn't think
memory allocations are a hot path.

Matt

> 
> Matt
> 
> > 
> > AVX instructions provide atomic write operations that cannot be interrupted
> > by the CPU scheduler. This ensures that GPU instruction sequences are
> > written completely before any potential vCPU preemption occurs.
> > 
> > AVX instructions (VMOVDQU) guarantee that entire instruction sequences are
> > written in a single, non-preemptible operation. The 5-dword CCS copy command
> > is expanded to 8 dwords (padded with 3 MI_NOOPs) to meet AVX 256-bit
> > alignment requirements. By the time the GPU executes the batch buffer (after
> > vCPU pause), all instructions are guaranteed to be completely written.
> > 
> > Here we are ensuring that GPU instructions are fully formed before the GPU
> > attempts to execute them during the migration process.
> > 
> > -Satya.>>
> > > > Let a summarized explanation in the commit message and put more here.
> > > > 
> > > > I'm sorry for being picky here, but I want to ensure that the information
> > > > around this code is clear so we don't keep having to explain this over
> > > > and over in the future.
> > > > 
> > > > > + * (128-bit XMM and 256-bit YMM) within kernel_fpu_begin()/kernel_fpu_end()
> > > > > + * sections. This prevents vCPU preemption during instruction generation,
> > > > > + * ensuring complete GPU commands are written to the batch buffer.
> > > > > + */
> > > > > +
> > > > > +static void memcpy_vmovdqu(struct xe_device *xe, void *dst, const void *src, u32 size)
> > > > > +{
> > > > > +	xe_assert(xe, !IS_DGFX(xe));
> > > > > +	xe_assert(xe, IS_SRIOV_VF(xe));
> > > > > +
> > > > > +#ifdef CONFIG_X86
> > > > > +	kernel_fpu_begin();
> > > > > +	if (size == SZ_128) {
> > > > > +		asm("vmovdqu (%0), %%xmm0\n"
> > > > > +		    "vmovups %%xmm0,   (%1)\n"
> > > > > +		    :: "r" (src), "r" (dst) : "memory");
> > > > > +	} else if (size == SZ_256) {
> > > > > +		asm("vmovdqu (%0), %%ymm0\n"
> > > > > +		    "vmovups %%ymm0,   (%1)\n"
> > > > > +		    :: "r" (src), "r" (dst) : "memory");
> > > > > +	}
> > > > > +	kernel_fpu_end();
> > > > > +#endif
> > > > > +}
> > > > > +
> > > > > +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
> > > > > +{
> > > > > +	u32 instr_size = size * BITS_PER_BYTE;
> > > > > +
> > > > > +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
> > > > > +
> > > > > +	if (IS_VF_CCS_READY(gt_to_xe(gt))) {
> > > > > +		xe_gt_assert(gt, static_cpu_has(X86_FEATURE_AVX));
> > > > > +		memcpy_vmovdqu(gt_to_xe(gt), dst, src, instr_size);
> > > > > +	} else {
> > > > > +		memcpy(dst, src, size);
> > > > > +	}
> > > > > +}
> > > > > +
> > > > > +#define EMIT_COPY_CCS_DW 8
> > > > >   static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > > >   			  u64 dst_ofs, bool dst_is_indirect,
> > > > >   			  u64 src_ofs, bool src_is_indirect,
> > > > >   			  u32 size)
> > > > >   {
> > > > > +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
> > > > >   	struct xe_device *xe = gt_to_xe(gt);
> > > > >   	u32 *cs = bb->cs + bb->len;
> > > > >   	u32 num_ccs_blks;
> > > > >   	u32 num_pages;
> > > > >   	u32 ccs_copy_size;
> > > > >   	u32 mocs;
> > > > > +	u32 i = 0;
> > > > >   	if (GRAPHICS_VERx100(xe) >= 2000) {
> > > > >   		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > > > > @@ -686,15 +741,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > > >   		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
> > > > >   	}
> > > > > -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> > > > > -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > > > -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > > > -		ccs_copy_size;
> > > > > -	*cs++ = lower_32_bits(src_ofs);
> > > > > -	*cs++ = upper_32_bits(src_ofs) | mocs;
> > > > > -	*cs++ = lower_32_bits(dst_ofs);
> > > > > -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> > > > > +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> > > > > +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > > > +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > > > +		  ccs_copy_size;
> > > > > +	dw[i++] = lower_32_bits(src_ofs);
> > > > > +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> > > > > +	dw[i++] = lower_32_bits(dst_ofs);
> > > > > +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
> > > > > +	/*
> > > > > +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > > > +	 * save/restore while this sequence is being issued, partial writes may trigger
> > > > > +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> > > > > +	 * write the sequence atomically.
> > > > > +	 */
> > > > > +	emit_atomic(gt, cs, dw, sizeof(dw));
> > > > > +	cs += EMIT_COPY_CCS_DW;
> > > > >   	bb->len = cs - bb->cs;
> > > > >   }
> > > > > @@ -1061,18 +1124,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
> > > > >   	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
> > > > >   }
> > > > > -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> > > > > +/*
> > > > > + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> > > > > + * save/restore while this sequence is being issued, partial writes may
> > > > > + * trigger page faults when saving iGPU CCS metadata. Use
> > > > > + * emit_atomic() to write the sequence atomically.
> > > > > + */
> > > > > +#define EMIT_FLUSH_INVALIDATE_DW 4
> > > > > +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
> > > > >   {
> > > > >   	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> > > > > +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
> > > > > +
> > > > > +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > > > +		      MI_FLUSH_IMM_DW | flags;
> > > > > +	dw[j++] = lower_32_bits(addr);
> > > > > +	dw[j++] = upper_32_bits(addr);
> > > > > +	dw[j++] = MI_NOOP;
> > > > > -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > > > -		  MI_FLUSH_IMM_DW | flags;
> > > > > -	dw[i++] = lower_32_bits(addr);
> > > > > -	dw[i++] = upper_32_bits(addr);
> > > > > -	dw[i++] = MI_NOOP;
> > > > > -	dw[i++] = MI_NOOP;
> > > > > +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
> > > > > -	return i;
> > > > > +	return i + j;
> > > > >   }
> > > > >   /**
> > > > > @@ -1117,7 +1189,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > >   	/* Calculate Batch buffer size */
> > > > >   	batch_size = 0;
> > > > >   	while (size) {
> > > > > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > > > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > > >   		u64 ccs_ofs, ccs_size;
> > > > >   		u32 ccs_pt;
> > > > > @@ -1158,7 +1230,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > >   	 * sizes here again before copy command is emitted.
> > > > >   	 */
> > > > >   	while (size) {
> > > > > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > > > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > > >   		u32 flush_flags = 0;
> > > > >   		u64 ccs_ofs, ccs_size;
> > > > >   		u32 ccs_pt;
> > > > > @@ -1181,11 +1253,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > >   		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> > > > > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > > > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > > >   		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> > > > >   						  src_L0_ofs, dst_is_pltt,
> > > > >   						  src_L0, ccs_ofs, true);
> > > > > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > > > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > > >   		size -= src_L0;
> > > > >   	}
> > > > > -- 
> > > > > 2.51.0
> > > > > 
> > > 
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
