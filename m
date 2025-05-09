Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDE7C3ABBC
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 16:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D729710EA9F;
	Fri,  9 May 2025 16:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yo0CmyP5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498A410EA9F
 for <intel-xe@lists.freedesktop.org>; Fri,  9 May 2025 16:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746808827; x=1778344827;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lnIOSFOm0CkcGHQjLqknKYo7US0ARvmverOBjy8vpEE=;
 b=Yo0CmyP5xWrROJ4Ml8E4ini1oy/sMyvjdKRKAhBxwrEFG+3EMrQz0gHk
 8tu4lGQX3sVyO5K0LAfFUEx3Xklxr/Rsi3ET2OQH6aP9oYU/odIBoWLCP
 UXW65ttQzp1wtcpYapCye3S4/fEVeYkbthpr5qjS9w4mAc8plz8m923PZ
 DQCrqjOe8rBkyzaXeVjWbsXTfrPUzaIf22qbhS4dpzFRcaAYiKz1DOd1R
 SxdeJR4uPg5El68QM8hJrGJkUCXAbpkdmfLgCb634XoIxpf4gB/LsO0iX
 lL/zY8tYn/RRBPlzJJnHfPZNAB3N4RNR2YL89HocmJwEN4mWGN4kZCnSi w==;
X-CSE-ConnectionGUID: l0PRJwIiTfmPvgyWmSFPtw==
X-CSE-MsgGUID: zihb/plrR0C5xnHCmYUtZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="47759329"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="47759329"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 09:40:19 -0700
X-CSE-ConnectionGUID: s6jDVpi9TiCC9/Ttmbcfgg==
X-CSE-MsgGUID: 8mYX7QacSSWA53MrG4KS8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="141578153"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 09:40:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 9 May 2025 09:40:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 9 May 2025 09:40:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 9 May 2025 09:40:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEyDCr7TNWAXS2h5G3WOg6acpK6PIl88sUbnJqrfepQifNhYN9/q/s7F8wI0kN2xhq875MBDQTVj0S+zAQiku0lLiVioc5AMbhrjduoEOWzjdh2RNdypmL0Dsb4ZQg1r+LsHT3U633/HT+IOXeJiSOSQZCLmfOqDZebnch3qLlw/EvUM+F/mKfXRQN5wcZpQ1rBDdoSqpnifDeqqbC+egkwyV6UX/u9E9VYPltn3yqavnizclZdoGVQvfyTocsOChW8IqaYLm5qVhSU1g1P64c7XIc7tKWeTdg8I9AKpyXt5SV9Vq1+JZkxuuROivIOHbFqMFsVXL8/YfFmFLVVl6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDScNIgDJXMDZGzMciIxhFlKFzEJiacfr0aL2Rvi6fE=;
 b=UrCNvDJqcf7wpgkIl1GcB7npkJPuyvVMin84QTgOC7XEdnaRlJcH5w5hlLs5zAdYlh32xqGWW49ki66wWKfSucadPIY3Z6pVuRTdH9omrHO1oQnHrFBs1M+Ac/+/eF49B3+G+Pzg8BSgkorUGV5XmXFigMevYg4bHX0INBzxD3NXIGTJEfSr5wyHNp86tk5xgo1WRQfHwNK1iOL0yHNjUaOVkwyDwDv9xLy17v+dh07nh0ASTgA6OgKBQbp9NfMjwOxV1sp+naDpe0J8HqM5xps+siv24aRtzamdUnTdqVldE0JNMI/K0Nsv1dL9V/tNgTFuYmH03uv3a0SGqmGHpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7252.namprd11.prod.outlook.com (2603:10b6:610:144::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 16:40:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8678.027; Fri, 9 May 2025
 16:40:16 +0000
Date: Fri, 9 May 2025 11:40:12 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH v5 3/3] drm/xe: Add WA BB to capture active context
 utilization
Message-ID: <o7fgtld3rfkiyrg53mrqtucbp7gbjvr2hyqeilpeftj3q7thvm@ctq3uipu3tgd>
References: <20250509161159.2173069-5-umesh.nerlige.ramappa@intel.com>
 <20250509161159.2173069-8-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250509161159.2173069-8-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW2PR16CA0002.namprd16.prod.outlook.com (2603:10b6:907::15)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: 314a38c6-e984-4608-9f92-08dd8f182d65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bw4kuAqeiaEgLw8xW2p7yMbSznb34k1mRzUYeEQ1jvXwyR7zWSuWAqfEQYkO?=
 =?us-ascii?Q?HrGHY7BP2w1R0hO0zyPbfveXEpN6LUxHUwDAkLNweZiBAnLl+1QXX01v+2sH?=
 =?us-ascii?Q?mXfQI/p2EZVyY2oXiKne3Cch8zp6HjyIG802/47Fb6vyQketZSgJV3xhgO8e?=
 =?us-ascii?Q?Xtv98k7wRH9R5z5RBJ6eZKjgmMrYniQOj73BEPNUg2Puo54KeHdEBQf8AJyZ?=
 =?us-ascii?Q?KQmyapbKKIvvUhfM6Auq8HOf89jucY+muqw0lbIdJOBD3bQPV7qJtA/flVbA?=
 =?us-ascii?Q?Zz8yddKU7bWII2qxGixSKbo71Hb9azCCqNXk4foqAm8HSUsHZZVOZVOjkDgu?=
 =?us-ascii?Q?7YKGTamM7gxHSV66iTuqmWBDwIYvtN2aE/7zUpslNRpvq2Ax7Qe2mdflTlPT?=
 =?us-ascii?Q?PICJClo9XHF7mq9obBW79wShxXHIVsxh1+RMfxH0SgFiAfFDjSeFV3wA/Byr?=
 =?us-ascii?Q?dEDb+cONUhc46JucDTsI9W9G08phI1hNn8Z776XJa7nCSQM9J+IkZu1brre3?=
 =?us-ascii?Q?s/tgyFLqJkLsMdA80csRwdU3BS9Cg+62DoElTO+QBVM7eExd87rR9xdzBPo6?=
 =?us-ascii?Q?mcZmV0ImWfXR1+TYtpWZiCa7cYd0FSFYK0mMWHE6sAcT47T9w6rKKIUFVdYl?=
 =?us-ascii?Q?EfZ8EozkGYwENCrw4cmQY02Kup+R6IOYoNr6cFaGgE7SKCFLA29HaypnNDcy?=
 =?us-ascii?Q?kPGZXXKZmciHwKGEPVT8s/1FMLGjc0q/9pL/vI6b6RSzbqIzpgB0w4OFXKDW?=
 =?us-ascii?Q?Djl8wo5sBmDTOb1wuru44fGbSUE8PEucIF91xEU8+VpDAkWdS2KTMDEumgkF?=
 =?us-ascii?Q?o2a5Le7JGqr2lcE6d6+FjYheLHOkqzxurG0wxh1F5zu6IhoLmZ2W9oJWfyk9?=
 =?us-ascii?Q?Z2PTd0S9mttYN+gHbYuwR7v+I93dh4fBS7J1IZEyf+bIW6o9xo7akg77b5XD?=
 =?us-ascii?Q?/ZrC4FKWWM4ib1lXVMdFAb9cVceUmZpfaqP2iSzS5z4xybt0Q2jsHQxJUz4A?=
 =?us-ascii?Q?ugfT6OvB612UjRhoI0CBmAwRoT0P6QFyoDaAYFeEN+RMP2gc/TVbaePLSEIQ?=
 =?us-ascii?Q?7t89i621OUKh/mp2V6UDU6uDnTJbyZ97MgJPqTmi0sotffZ58G0B+ib75oJ0?=
 =?us-ascii?Q?Ox/eOumNg3pg3BMyZRQvCqJl1HQfSba6vKtA2mtEuSSpg4L6sxpXHN1apO9t?=
 =?us-ascii?Q?fUYrnGcW/NIoEQM3ROsTPpHQU1URfi1IP2lBSmlpkTwNqTnGv48UUD4GROjQ?=
 =?us-ascii?Q?75wZUXGQc6/Vk5siZyBs5JXj2vX9UAXp1jk+YMx2ThVJMpGSOer0x93cOccw?=
 =?us-ascii?Q?VNUSgaZe16jhVFV7R1NjE0geu92uscpwHKlIBIxQiZj+zuFddmjQk4BiKMBB?=
 =?us-ascii?Q?59olVpk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KBuRR1W+EH8aBsliFR6bFebVzPe1kFjpmJbPAqbk41bwno53+zKYk9l56WM1?=
 =?us-ascii?Q?JCYW5mOcgG3db53VYGtMEvk2WL/NwRNRlntfRoFiExGzHF88EEImgSj92YBs?=
 =?us-ascii?Q?bXTV0XtWVwZ3YFeYQdeCe8+RDpv2aqm7RkIcFPMfVDjOVaIdeBhW9X3pjo1G?=
 =?us-ascii?Q?Y3vO0riHipnoMMBYkqUIsB2s2vtT7ovYYuL8vXpNLQEFTDB1HNBq+kXz6mB7?=
 =?us-ascii?Q?jXsRSKUbjmy7t81lPfpmsdvu1IPPs1QQm+HanvVQtJNZwT7r6HrEWblc2NGL?=
 =?us-ascii?Q?/rLLsl8gCpTWEzFK1qxiopPf93VldnB01hEd4fnGiCZTpYNpdiOQewkFpmTm?=
 =?us-ascii?Q?1BNZQCkii1JayK7NgklMQfMkvNo6IJU37oqNbcM5PAjN5obMNZN1BQ0N7lUY?=
 =?us-ascii?Q?RlBTybuz/k8rKzs/0h/gCvx0BumTVT137yqsKRL+6+u7XAvaBvKDpUC2VTW4?=
 =?us-ascii?Q?+mPClN3Qy6gT6xALXMBp+42wy4wzQLpaVlqmtbnLs7WVVMMWmuCu+NDV5QJS?=
 =?us-ascii?Q?tkaZDnq1nixwf9gK08dBFBm4XgvJ+yisRL6vhYiu7UzUimPqYqJPWACfaMbv?=
 =?us-ascii?Q?o/+83kuTI91xajvRWlIPPTXTQ4wb8Q4Zhl/8KOzr+DNnCzEWyQkYOQrZzUO9?=
 =?us-ascii?Q?VaacHg2LuvxzPX7HdYE9a+KkTyzQ+5dFXzuFFsQfXaIWYVNo/PIiD6tJzyV/?=
 =?us-ascii?Q?xk0Vc++jdQLO9X1c7VvdORJOC47mrb+XgR2u6vgfhkXWPs9ZCW2udMvrBaYk?=
 =?us-ascii?Q?VOKSUtVs9PJDqne19f7+VUP0EacjUAkSKJHjUSRTlPVajTbNtbtZIOyr2YpT?=
 =?us-ascii?Q?Tqz4WB/vTSz5THDGlRLUCKrM+2rapq2e2nm4clI7zJag5vPWribh/VttbMXW?=
 =?us-ascii?Q?lymDQl+6um7LHhhpJD25QfYnXXUmPyBfuFWUkVL3wc8zh9bowTM0cP1r3+DT?=
 =?us-ascii?Q?+OWrbqSF1HUevTpOr7kWElfOysoWXSXlZQVpPcKx9K2tG8bkDzQKArI1oyZn?=
 =?us-ascii?Q?m6EfgwcelrTNbtSMZQZ0vcYJiXUJLanJXqgYxgfykwI+Mx9Hu6zij8b5GZsz?=
 =?us-ascii?Q?/9/4EnWPstyxGOCQ/ZIsbKhbaFH4uqTfcAZuUUiasofvpDMtlLc4QOgMVMgG?=
 =?us-ascii?Q?LSIVQwyxLKuOc4nHq1WfzVUBcs7fAvXhuKl7PasmHRIXDYy9yaICqRgAi8Jc?=
 =?us-ascii?Q?9v22iLQvzfoh13BB5KaHH9B9V+0D1h509mIm8O7BJgf5ixxtigy+Y0rq/64R?=
 =?us-ascii?Q?zALPpeoJavvfoFo++7dhnLMo6WE/xw6KlCMDXrZyFaU/E5vWeLk4Tsrw655W?=
 =?us-ascii?Q?sBVo2Zi1hOR9TvXrzurvykfu0wskfhNxHOmyLxPIVpJ+iLQQmHaeClafna+Z?=
 =?us-ascii?Q?t9SF6cvQ42EsaU5c+y18BjczY90L31w4vcWBeFN5dGGMIMu864qlAF3+nAMJ?=
 =?us-ascii?Q?ZKQJVqk4wTS/dwufNBqq+52/0MqyvxdSrGvD4jlxmGPBLhn98ccoR29dT0mR?=
 =?us-ascii?Q?TGDzefogWtG4Rk1sUgzOhC4TpWDUKRnz/4EBjtaszXPBM3o5MfQ7D7sDsxpZ?=
 =?us-ascii?Q?fL6haC8Of5RosTpRdJjINiF3LjS7jQOmm6UuA3qJtSWhaUJVnjamvD57HIdD?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 314a38c6-e984-4608-9f92-08dd8f182d65
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:40:16.3182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYGSF78KG2lo7S8hQ2VLIZDeA7F3p1+Ws8n8vG0ct4HvHiqP76IEjmNuNFsvaOOAXbqo1NtwXxhPvpkm+fy21FpFOvi5vXFb8k05MpKgNok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7252
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

On Fri, May 09, 2025 at 09:12:03AM -0700, Umesh Nerlige Ramappa wrote:
>Context Timestamp (CTX_TIMESTAMP) in the LRC accumulates the run ticks
>of the context, but only gets updated when the context switches out. In
>order to check how long a context has been active before it switches
>out, two things are required:
>
>(1) Determine if the context is running:
>
>To do so, we program the WA BB to set an initial value for CTX_TIMESTAMP
>in the LRC. The value chosen is 1 since 0 is the initial value when the
>LRC is initialized. During a query, we just check for this value to
>determine if the context is active. If the context switched out, it
>would overwrite this location with the actual CTX_TIMESTAMP MMIO value.
>Note that WA BB runs as the last part of the context restore, so reusing
>this LRC location will not clobber anything.
>
>(2) Calculate the time that the context has been active for:
>
>The CTX_TIMESTAMP ticks only when the context is active. If a context is
>active, we just use the CTX_TIMESTAMP MMIO as the new value of
>utilization. While doing so, we need to read the CTX_TIMESTAMP MMIO
>for the specific engine instance. Since we do not know which instance
>the context is running on until it is scheduled, we also read the
>ENGINE_ID MMIO in the WA BB and store it in the PPHSWP.
>
>Using the above 2 instructions in a WA BB, capture active context
>utilization.
>
>v2: (Matt Brost)
>- This breaks TDR, fix it by saving the CTX_TIMESTAMP register
>  "drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC value"
>- Drop tile from LRC if using gt
>  "drm/xe: Save the gt pointer in LRC and drop the tile"
>
>v3:
>- Remove helpers for bb_per_ctx_ptr (Matt)
>- Add define for context active value (Matt)
>- Use 64 bit CTX TIMESTAMP for platforms that support it. For platforms
>  that don't, live with the rare race. (Matt, Lucas)
>- Convert engine id to hwe and get the MMIO value (Lucas)
>- Correct commit message on when WA BB runs (Lucas)
>
>v4:
>- s/GRAPHICS_VER(...)/xe->info.has_64bit_timestamp/ (Matt)
>- Drop support for active utilization on a VF (CI failure)
>- In xe_lrc_init ensure the lrc value is 0 to begin with (CI regression)
>
>v5:
>- Minor checkpatch fix
>- Squash into previous commit and make TDR use 32-bit time
>- Update code comment to match commit msg
>
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4532
>Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/regs/xe_engine_regs.h |   5 +
> drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   2 +
> drivers/gpu/drm/xe/xe_device_types.h     |   2 +
> drivers/gpu/drm/xe/xe_exec_queue.c       |   2 +-
> drivers/gpu/drm/xe/xe_guc_submit.c       |   2 +-
> drivers/gpu/drm/xe/xe_lrc.c              | 185 ++++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_lrc.h              |   5 +-
> drivers/gpu/drm/xe/xe_lrc_types.h        |   5 +-
> drivers/gpu/drm/xe/xe_pci.c              |   2 +
> drivers/gpu/drm/xe/xe_pci_types.h        |   1 +
> drivers/gpu/drm/xe/xe_trace_lrc.h        |   8 +-
> 11 files changed, 203 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>index da713634d6a0..7ade41e2b7b3 100644
>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>@@ -43,6 +43,10 @@
> #define XEHPC_BCS8_RING_BASE			0x3ee000
> #define GSCCS_RING_BASE				0x11a000
>
>+#define ENGINE_ID(base)				XE_REG((base) + 0x8c)
>+#define   ENGINE_INSTANCE_ID			REG_GENMASK(9, 4)
>+#define   ENGINE_CLASS_ID			REG_GENMASK(2, 0)
>+
> #define RING_TAIL(base)				XE_REG((base) + 0x30)
> #define   TAIL_ADDR				REG_GENMASK(20, 3)
>
>@@ -154,6 +158,7 @@
> #define   STOP_RING				REG_BIT(8)
>
> #define RING_CTX_TIMESTAMP(base)		XE_REG((base) + 0x3a8)
>+#define RING_CTX_TIMESTAMP_UDW(base)		XE_REG((base) + 0x3ac)
> #define CSBE_DEBUG_STATUS(base)			XE_REG((base) + 0x3fc)
>
> #define RING_FORCE_TO_NONPRIV(base, i)		XE_REG(((base) + 0x4d0) + (i) * 4)
>diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>index 57944f90bbf6..994af591a2e8 100644
>--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>@@ -11,7 +11,9 @@
> #define CTX_RING_TAIL			(0x06 + 1)
> #define CTX_RING_START			(0x08 + 1)
> #define CTX_RING_CTL			(0x0a + 1)
>+#define CTX_BB_PER_CTX_PTR		(0x12 + 1)
> #define CTX_TIMESTAMP			(0x22 + 1)
>+#define CTX_TIMESTAMP_UDW		(0x24 + 1)
> #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
> #define CTX_PDP0_UDW			(0x30 + 1)
> #define CTX_PDP0_LDW			(0x32 + 1)
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 495bc00ebed4..9446a739948c 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -334,6 +334,8 @@ struct xe_device {
> 		u8 has_sriov:1;
> 		/** @info.has_usm: Device has unified shared memory support */
> 		u8 has_usm:1;
>+		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
>+		u8 has_64bit_timestamp:1;
> 		/** @info.is_dgfx: is discrete device */
> 		u8 is_dgfx:1;
> 		/** @info.needs_scratch: needs scratch page for oob prefetch to work */
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index 606922d9dd73..cd9b1c32f30f 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -830,7 +830,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
> {
> 	struct xe_device *xe = gt_to_xe(q->gt);
> 	struct xe_lrc *lrc;
>-	u32 old_ts, new_ts;
>+	u64 old_ts, new_ts;
> 	int idx;
>
> 	/*
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 813c3c0bb250..59f52cc11bf5 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -950,7 +950,7 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> 		return xe_sched_invalidate_job(job, 2);
> 	}
>
>-	ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
>+	ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(q->lrc[0]));
> 	ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
>
> 	/*
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 9d9be9383207..61a2e87990a9 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -24,6 +24,7 @@
> #include "xe_hw_fence.h"
> #include "xe_map.h"
> #include "xe_memirq.h"
>+#include "xe_mmio.h"
> #include "xe_sriov.h"
> #include "xe_trace_lrc.h"
> #include "xe_vm.h"
>@@ -654,6 +655,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
> #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
> #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
> #define LRC_PARALLEL_PPHWSP_OFFSET 2048
>+#define LRC_ENGINE_ID_PPHWSP_OFFSET 2096
>
> u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
> {
>@@ -697,11 +699,21 @@ static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
> 	return xe_lrc_pphwsp_offset(lrc) + LRC_PARALLEL_PPHWSP_OFFSET;
> }
>
>+static inline u32 __xe_lrc_engine_id_offset(struct xe_lrc *lrc)
>+{
>+	return xe_lrc_pphwsp_offset(lrc) + LRC_ENGINE_ID_PPHWSP_OFFSET;
>+}
>+
> static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
> {
> 	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
> }
>
>+static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
>+{
>+	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP_UDW * sizeof(u32);
>+}
>+
> static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
> {
> 	/* Indirect ring state page is at the very end of LRC */
>@@ -729,8 +741,10 @@ DECL_MAP_ADDR_HELPERS(regs)
> DECL_MAP_ADDR_HELPERS(start_seqno)
> DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
> DECL_MAP_ADDR_HELPERS(ctx_timestamp)
>+DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw)
> DECL_MAP_ADDR_HELPERS(parallel)
> DECL_MAP_ADDR_HELPERS(indirect_ring)
>+DECL_MAP_ADDR_HELPERS(engine_id)
>
> #undef DECL_MAP_ADDR_HELPERS
>
>@@ -745,19 +759,38 @@ u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc)
> 	return __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
> }
>
>+/**
>+ * xe_lrc_ctx_timestamp_udw_ggtt_addr() - Get ctx timestamp udw GGTT address
>+ * @lrc: Pointer to the lrc.
>+ *
>+ * Returns: ctx timestamp udw GGTT address
>+ */
>+u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc)
>+{
>+	return __xe_lrc_ctx_timestamp_udw_ggtt_addr(lrc);
>+}
>+
> /**
>  * xe_lrc_ctx_timestamp() - Read ctx timestamp value
>  * @lrc: Pointer to the lrc.
>  *
>  * Returns: ctx timestamp value
>  */
>-u32 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
>+u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
> {
> 	struct xe_device *xe = lrc_to_xe(lrc);
> 	struct iosys_map map;
>+	u32 ldw, udw = 0;
>
> 	map = __xe_lrc_ctx_timestamp_map(lrc);
>-	return xe_map_read32(xe, &map);
>+	ldw = xe_map_read32(xe, &map);
>+
>+	if (xe->info.has_64bit_timestamp) {
>+		map = __xe_lrc_ctx_timestamp_udw_map(lrc);
>+		udw = xe_map_read32(xe, &map);
>+	}
>+
>+	return (u64)udw << 32 | ldw;
> }
>
> /**
>@@ -880,6 +913,65 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
> 	xe_bo_unpin(lrc->bo);
> 	xe_bo_unlock(lrc->bo);
> 	xe_bo_put(lrc->bo);
>+	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
>+}
>+
>+/*
>+ * xe_lrc_setup_utilization() - Setup wa bb to assist in calculating active
>+ * context run ticks.
>+ * @lrc: Pointer to the lrc.
>+ *
>+ * Context Timestamp (CTX_TIMESTAMP) in the LRC accumulates the run ticks of the
>+ * context, but only gets updated when the context switches out. In order to
>+ * check how long a context has been active before it switches out, two things
>+ * are required:
>+ *
>+ * (1) Determine if the context is running:
>+ * To do so, we program the WA BB to set an initial value for CTX_TIMESTAMP in
>+ * the LRC. The value chosen is 1 since 0 is the initial value when the LRC is
>+ * initialized. During a query, we just check for this value to determine if the
>+ * context is active. If the context switched out, it would overwrite this
>+ * location with the actual CTX_TIMESTAMP MMIO value. Note that WA BB runs as
>+ * the last part of context restore, so reusing this LRC location will not
>+ * clobber anything.
>+ *
>+ * (2) Calculate the time that the context has been active for:
>+ * The CTX_TIMESTAMP ticks only when the context is active. If a context is
>+ * active, we just use the CTX_TIMESTAMP MMIO as the new value of utilization.
>+ * While doing so, we need to read the CTX_TIMESTAMP MMIO for the specific
>+ * engine instance. Since we do not know which instance the context is running
>+ * on until it is scheduled, we also read the ENGINE_ID MMIO in the WA BB and
>+ * store it in the PPHSWP.
>+ */
>+#define CONTEXT_ACTIVE 1ULL
>+static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
>+{
>+	u32 *cmd;
>+
>+	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
>+
>+	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
>+	*cmd++ = ENGINE_ID(0).addr;
>+	*cmd++ = __xe_lrc_engine_id_ggtt_addr(lrc);
>+	*cmd++ = 0;
>+
>+	*cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
>+	*cmd++ = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
>+	*cmd++ = 0;
>+	*cmd++ = lower_32_bits(CONTEXT_ACTIVE);
>+
>+	if (lrc_to_xe(lrc)->info.has_64bit_timestamp) {
>+		*cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
>+		*cmd++ = __xe_lrc_ctx_timestamp_udw_ggtt_addr(lrc);
>+		*cmd++ = 0;
>+		*cmd++ = upper_32_bits(CONTEXT_ACTIVE);
>+	}
>+
>+	*cmd++ = MI_BATCH_BUFFER_END;
>+
>+	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
>+			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
>+
> }
>
> #define PVC_CTX_ASID		(0x2e + 1)
>@@ -921,10 +1013,17 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	if (IS_ERR(lrc->bo))
> 		return PTR_ERR(lrc->bo);
>
>+	lrc->bb_per_ctx_bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
>+						  ttm_bo_type_kernel,
>+						  bo_flags);
>+	if (IS_ERR(lrc->bb_per_ctx_bo)) {
>+		err = PTR_ERR(lrc->bb_per_ctx_bo);
>+		goto err_lrc_finish;
>+	}
>+
> 	lrc->size = lrc_size;
> 	lrc->ring.size = ring_size;
> 	lrc->ring.tail = 0;
>-	lrc->ctx_timestamp = 0;
>
> 	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
> 			     hwe->fence_irq, hwe->name);
>@@ -997,7 +1096,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 				     xe_lrc_read_ctx_reg(lrc, CTX_CONTEXT_CONTROL) |
> 				     _MASKED_BIT_ENABLE(CTX_CTRL_PXP_ENABLE));
>
>+	lrc->ctx_timestamp = 0;
> 	xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP, 0);
>+	if (lrc_to_xe(lrc)->info.has_64bit_timestamp)
>+		xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP_UDW, 0);
>
> 	if (xe->info.has_asid && vm)
> 		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm->usm.asid);
>@@ -1026,6 +1128,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	map = __xe_lrc_start_seqno_map(lrc);
> 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>
>+	xe_lrc_setup_utilization(lrc);
>+
> 	return 0;
>
> err_lrc_finish:
>@@ -1245,6 +1349,21 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc)
> 	return __xe_lrc_parallel_map(lrc);
> }
>
>+/**
>+ * xe_lrc_engine_id() - Read engine id value
>+ * @lrc: Pointer to the lrc.
>+ *
>+ * Returns: context id value
>+ */
>+static u32 xe_lrc_engine_id(struct xe_lrc *lrc)
>+{
>+	struct xe_device *xe = lrc_to_xe(lrc);
>+	struct iosys_map map;
>+
>+	map = __xe_lrc_engine_id_map(lrc);
>+	return xe_map_read32(xe, &map);
>+}
>+
> static int instr_dw(u32 cmd_header)
> {
> 	/* GFXPIPE "SINGLE_DW" opcodes are a single dword */
>@@ -1692,7 +1811,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> 	snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
> 	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset;
> 	snapshot->lrc_snapshot = NULL;
>-	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
>+	snapshot->ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(lrc));
> 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
> 	return snapshot;
> }
>@@ -1792,22 +1911,74 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
> 	kfree(snapshot);
> }
>
>+static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
>+{
>+	u16 class = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
>+	u16 instance = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);
>+	struct xe_hw_engine *hwe;
>+	u64 val;
>+
>+	hwe = xe_gt_hw_engine(lrc->gt, class, instance, false);
>+	if (xe_gt_WARN_ONCE(lrc->gt, !hwe || xe_hw_engine_is_reserved(hwe),
>+			    "Unexpected engine class:instance %d:%d for context utilization\n",
>+			    class, instance))
>+		return -1;
>+
>+	if (lrc_to_xe(lrc)->info.has_64bit_timestamp)
>+		val = xe_mmio_read64_2x32(&hwe->gt->mmio,
>+					  RING_CTX_TIMESTAMP(hwe->mmio_base));
>+	else
>+		val = xe_mmio_read32(&hwe->gt->mmio,
>+				     RING_CTX_TIMESTAMP(hwe->mmio_base));
>+
>+	*reg_ctx_ts = val;
>+
>+	return 0;
>+}
>+
> /**
>  * xe_lrc_update_timestamp() - Update ctx timestamp
>  * @lrc: Pointer to the lrc.
>  * @old_ts: Old timestamp value
>  *
>  * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
>- * update saved value.
>+ * update saved value. With support for active contexts, the calculation may be
>+ * slightly racy, so follow a read-again logic to ensure that the context is
>+ * still active before returning the right timestamp.
>  *
>  * Returns: New ctx timestamp value
>  */
>-u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
>+u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
> {
>+	u64 lrc_ts, reg_ts;
>+	u32 engine_id;
>+
> 	*old_ts = lrc->ctx_timestamp;
>
>-	lrc->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
>+	lrc_ts = xe_lrc_ctx_timestamp(lrc);
>+	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
>+	if (IS_SRIOV_VF(lrc_to_xe(lrc))) {
>+		lrc->ctx_timestamp = lrc_ts;
>+		goto done;
>+	}
>+
>+	if (lrc_ts == CONTEXT_ACTIVE) {
>+		engine_id = xe_lrc_engine_id(lrc);
>+		if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
>+			lrc->ctx_timestamp = reg_ts;
>+
>+		/* read lrc again to ensure context is still active */
>+		lrc_ts = xe_lrc_ctx_timestamp(lrc);
>+	}
>+
>+	/*
>+	 * If context switched out, just use the lrc_ts. Note that this needs to
>+	 * be a separate if condition.
>+	 */
>+	if (lrc_ts != CONTEXT_ACTIVE)
>+		lrc->ctx_timestamp = lrc_ts;
>
>+done:
> 	trace_xe_lrc_update_timestamp(lrc, *old_ts);
>
> 	return lrc->ctx_timestamp;
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index 0b40f349ab95..eb6e8de8c939 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -120,7 +120,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
> void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot);
>
> u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc);
>-u32 xe_lrc_ctx_timestamp(struct xe_lrc *lrc);
>+u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc);
>+u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc);
> u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc);
> u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc);
>
>@@ -136,6 +137,6 @@ u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc);
>  *
>  * Returns the current LRC timestamp
>  */
>-u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts);
>+u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts);
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>index cd38586ae989..ae24cf6f8dd9 100644
>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>@@ -52,7 +52,10 @@ struct xe_lrc {
> 	struct xe_hw_fence_ctx fence_ctx;
>
> 	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
>-	u32 ctx_timestamp;
>+	u64 ctx_timestamp;
>+
>+	/** @bb_per_ctx_bo: buffer object for per context batch wa buffer */
>+	struct xe_bo *bb_per_ctx_bo;
> };
>
> struct xe_lrc_snapshot;
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 882398e09b7e..024175cfe61e 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -142,6 +142,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
> 	.has_indirect_ring_state = 1, \
> 	.has_range_tlb_invalidation = 1, \
> 	.has_usm = 1, \
>+	.has_64bit_timestamp = 1, \
> 	.va_bits = 48, \
> 	.vm_max_level = 4, \
> 	.hw_engine_mask = \
>@@ -677,6 +678,7 @@ static int xe_info_init(struct xe_device *xe,
>
> 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
> 	xe->info.has_usm = graphics_desc->has_usm;
>+	xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
>
> 	for_each_remote_tile(tile, xe, id) {
> 		int err;
>diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>index e9b9bbc138d3..ca6b10d35573 100644
>--- a/drivers/gpu/drm/xe/xe_pci_types.h
>+++ b/drivers/gpu/drm/xe/xe_pci_types.h
>@@ -21,6 +21,7 @@ struct xe_graphics_desc {
> 	u8 has_indirect_ring_state:1;
> 	u8 has_range_tlb_invalidation:1;
> 	u8 has_usm:1;
>+	u8 has_64bit_timestamp:1;
> };
>
> struct xe_media_desc {
>diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
>index 5c669a0b2180..d525cbee1e34 100644
>--- a/drivers/gpu/drm/xe/xe_trace_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
>@@ -19,12 +19,12 @@
> #define __dev_name_lrc(lrc)	dev_name(gt_to_xe((lrc)->fence_ctx.gt)->drm.dev)
>
> TRACE_EVENT(xe_lrc_update_timestamp,
>-	    TP_PROTO(struct xe_lrc *lrc, uint32_t old),
>+	    TP_PROTO(struct xe_lrc *lrc, uint64_t old),
> 	    TP_ARGS(lrc, old),
> 	    TP_STRUCT__entry(
> 		     __field(struct xe_lrc *, lrc)
>-		     __field(u32, old)
>-		     __field(u32, new)
>+		     __field(u64, old)
>+		     __field(u64, new)
> 		     __string(name, lrc->fence_ctx.name)
> 		     __string(device_id, __dev_name_lrc(lrc))
> 	    ),
>@@ -36,7 +36,7 @@ TRACE_EVENT(xe_lrc_update_timestamp,
> 		   __assign_str(name);
> 		   __assign_str(device_id);
> 		   ),
>-	    TP_printk("lrc=:%p lrc->name=%s old=%u new=%u device_id:%s",
>+	    TP_printk("lrc=:%p lrc->name=%s old=%llu new=%llu device_id:%s",
> 		      __entry->lrc, __get_str(name),
> 		      __entry->old, __entry->new,
> 		      __get_str(device_id))
>-- 
>2.43.0
>
