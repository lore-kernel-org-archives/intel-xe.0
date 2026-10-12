Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC926CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 13:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA32C10F10A;
	Mon, 12 Oct 2026 13:40:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A526510E57E;
 Mon, 12 Oct 2026 13:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791812448; x=1823348448;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=Hcyjuk/OH4TQOqhaDb98YzeeISbJM3kEM0Lxf1lnVlY=;
 b=YRtk3LQPMbeD9PipCFcMp+4HaXrpRH4DH3FfA9FYdQ+z0gMUU1WzdxZm
 dB9gPFv/DUkOB25yg23rMfsa3J0ohND8gyWdoF5VomEZ84iBaaI7XwF7D
 u8jX+xnc3WF3IMYxH0FJrM2FemGu6OTtCzhtmbHWiGm7UDcvJoUVPGva4
 LlYBlTR4/zi81RjkB4NJEA3i6xSPYfqhfo4p3oiXDro96LMi76XFYXptb
 KRZYJ6DtNZAaqHmi0xKgInvpKrELXv+EG8u7uMOYa1hzubKTxvau87kxv
 xHII+g+xHOwEK6HKYNkhAnNL3xAZA7GqrhQAHD07HBTZyLtdEsiajyIKm Q==;
X-CSE-ConnectionGUID: qd2s1p1ZSXOpC7ULb16EEA==
X-CSE-MsgGUID: H4T5K53wRWOjGqO4v52hOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="416965"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="416965"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 06:40:47 -0700
X-CSE-ConnectionGUID: BXNjnSvtQ120qojxNDqVDg==
X-CSE-MsgGUID: yio7YykEQme4vh0dQkP77g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1091166"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 06:40:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 06:40:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 06:40:46 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 06:40:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIKaj6QIT5Yjo2mzqaMSTK7hAT7aVpzylqDWj+XoKHxXHeECm+e9Zcubci/V2JOjy5WDNCdTN/zjwwDhWBkyeShvQTuQrY75UWnr6VXAFVxGHMwVQ70o4vdYJyDt7U38ETTOOfT5SlTSLAZDXDlNQp75ZyzthLy15ew2te7X1YLbFfNf+0hDzpKrGYEWEAP8ZhwM4thBwFkWzbkFhYllqXUCeVbC0OBGzNloHKpoaxoUvEhLW3HSnbgSjMEnplfIn+SrmdIwrWtAvq/mijjsZ0g9HfYHmQdiZsAygNYvU6bA4AK7cqOxcyHQAIILikopo7TcSA2weml/4xgOgwfUHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJeCFmeohRe/qIAQYMH+6tZ9PUpZ2CE5UNfoftwiTfk=;
 b=JeEUsUoHjmpkDdWIUZcYNveHSHR9K0WVDb8QKNjoxm3v6FRqFv4I8C+tsQJvOUGDNCnX26rlINOe40IJl+kYZXH48qbezWjNrty2uadwv7wXn6DfsnuwilOSGWrpw3v/uKSJhc026FFdvVpD8W2/UyOHXhKCAaoyiKzKGXBdwEOUSL/VcKbsAs/cFN6Pwzs2WNklpaJumYe8vF0F+srEVn5QtSj1lbqSlg1Wx+cpiGwiNmrNRzfv7mEK9t0HQT37rWLoPz2KPNzxqG6D0jneXdAoqCN5gSnjw6OT2XfDFhisTA9UAELWjkOR50tJeAapaK6csXB3CGrgVWq6WFscoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by DM4PR11MB6501.namprd11.prod.outlook.com (2603:10b6:8:88::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.21; Mon, 12 Oct 2026 13:40:42 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 13:40:42 +0000
Date: Mon, 12 Oct 2026 16:40:34 +0300
From: Imre Deak <imre.deak@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Nautiyal, 
 Ankit K" <ankit.k.nautiyal@intel.com>, "arun.r.murthy@intel.comm"
 <arun.r.murthy@intel.comm>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: Re: [PATCH] drm/i915/pps: Don't block DC states while the VDD
 override is held
Message-ID: <aszjUoBgRD1qw1pR@ideak-desk.lan>
References: <20260928061211.2764543-1-suraj.kandpal@intel.com>
 <03e6056ddce4ff7c7e6f0dafdfe42a75e0beb203@intel.com>
 <DS4PPFE901A304F2F30F230DF7378468608E38D2@DS4PPFE901A304F.namprd11.prod.outlook.com>
 <asTKYt20sv0MZWTR@ideak-desk.lan>
 <DS4PPFE901A304FB85B62952D8D702EE805E39F2@DS4PPFE901A304F.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DS4PPFE901A304FB85B62952D8D702EE805E39F2@DS4PPFE901A304F.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GVX0EPF0005F6A0.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::127) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|DM4PR11MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: 158cf6c6-7899-4ef0-2865-08df286668a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|56012099006|11063799006|5023799004|4143699003|261009223027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: cB9BwoE6qsVf29rsR+7BsGpvFF1hI1zFWmGrh3aqsLqE0+6fTFyn0yepR28sa+Jwouobhzn4EEOcWeXOHXYxAiRTXbiK5Hxk8fmWDUQZqA0v/beQDPTFTociw0796MhAYKx/bnRijV0GVSVxGgms3R78E0SQEqZcYeG8/rg4RkjBGDJOcyUeh1UuwyXGPWk/MUW90Z3V5Be+/xp5F/50M4VE3/JnCLnzrylo/7z6Fott5solXuf9QieXUoePa9bYG8IOrKUI368fj50n6vGzXJN3na6W1q497KhtjLLp8IEDzZ1618hDww6qC/9xOI2VSC9yT5AbKAFxc+ava9gTqfgHNL1eKKv+GPNcAXQvVSYxM4gCiOGmlgdqPlbLjWbv7xfKe0yNiOBmdO0SMS58JlAPJPDfHJV6jtpNrJBzLCTD6H5D1mPk14NNl+e/kO3zBTg31sL1ye+CGJd118yoGEKFjovAvV/NIBxkhwYD4MBi56nSc4PXmPs9AFGj1CHI8hO9KxvleYNqpLuqXtyDieIkokQP5CrAmNPC+dIFGufOylImPIyDnEBhPOXYLbHL7/E74uZuTXfrQ+6PognSgSQlJaK18MWqKM81aoloep3NQliojbMLsTUe13xj6BNqs3/xE7o4Xu2MeGAk4WvoyGhJ7wjHE5KRj5euwzn8ofs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(5023799004)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3yoa4JD4y1lvUWs+2bi4cIf9CtQW4+3B09eeMShotoVu+Ge8udw994y6EZQz?=
 =?us-ascii?Q?G3RW+JLKlh6rIqrMOS/RMvncgNc8Frxr6RsYUcv8JntxJTM5dN+MxNkI+ybQ?=
 =?us-ascii?Q?GzIPhqXsKgQylTc0mtU67PAANcIpXAZaRtfhrHlaaBpwDYoCpVGVsr+r6Mvv?=
 =?us-ascii?Q?LcPWGzT6sg5yV5R6YGNhMsGJN9Crs2S5hIcLmAehxTvsXbvfJQvK9p31RRI+?=
 =?us-ascii?Q?vozWl4NS/N7W50bQyv8mibwLlky7sDizeKzzvzFroeJeqdejsshTbLpyUBv3?=
 =?us-ascii?Q?UsJNrPnJ//OiVakNVEMCXHLtaCKZVLmj2WESx4PwDq2jtpQyi+Rd1gCIT/ed?=
 =?us-ascii?Q?tnTiYbc1asogJRNHgk+ENWxvxBID0/uoIe2ujR45KQz32yHng7VagxCzoC60?=
 =?us-ascii?Q?BpWBWirHeKH+i9I4O9X4jUzuTKuy8BP9Tl4c+bdb96p4V0PSJd8mmCj0PCfM?=
 =?us-ascii?Q?ZA+gXwBnfHb1jQK55p4svUTG0JsBa9qgswf60fqwBRrc1Aiv5n5jX5Zg/Xm0?=
 =?us-ascii?Q?5jwujhP+u+PUdo+JRX47MFzjVIJUU2p+gVAPHfFOfpzZeWyzpDW2Ai8RZopD?=
 =?us-ascii?Q?L/AC0Szpa9qlAsKxMwJSW7w1FAMtpsjm2o6ekbJkGGj29RwpktYmSYQY60SN?=
 =?us-ascii?Q?pLQqGk2pEizEFzi/cp2hT82rSgdSoh/MbRT/WIU6n2IqK3b8iF2wI6lf6hd4?=
 =?us-ascii?Q?W+yXNmjxA7iD+ZXi6f0eO1M3smg5DFNf0pl7JXw0FA6B14KOIE7W+hgkTlRT?=
 =?us-ascii?Q?I8/iFWxEqCh+MyzQ2MSTuLHx4Z28k9j3tLLfnk8Z4vy7jAxkxl3Wyx/bf2zq?=
 =?us-ascii?Q?y92aGjxfCc6xAl2kku7DFyBCT+c4iDQEGoMhJkOSPgk4I6ibhlqxsqw4oLSi?=
 =?us-ascii?Q?/0SIO7/vU4u7dv/JB297mCME/3S4xGgROitjb++MAibyTFnzIGKbm0f4w++e?=
 =?us-ascii?Q?knfi3jGT6XS+4xHjR6xOYrNnCXsRoqA5OBS4Zrfna+jVRzNokItil6KuHcPO?=
 =?us-ascii?Q?HT/REmmNalOorTVDfGlbbgx1Py1vifuHkTdopLi6GwwfHA2ahnSiG61YAxg/?=
 =?us-ascii?Q?zZLhx07wXa8LNMvCo8GRwAAgwcjJCZvZqFsP+Zwb/0YyFefR9drtMMg7md9i?=
 =?us-ascii?Q?PxNKwkbkLAtgE+mwH8UWG3VQofABzNT8B1voyRTNkuCstr/Sp/dfoso73fQR?=
 =?us-ascii?Q?W3yVO9da4cVXExUsxVUJONmHQKQM0VQFwb3P4wcisPqwDmMnXwV50/+0RtIu?=
 =?us-ascii?Q?OLCmLSCuNmy0JoQP3Q7quRn0dtThZCet7zr+g0e88X3D/pHRYBPUHTlzswry?=
 =?us-ascii?Q?Ir4JWzQOJliB6KMK15nvlCpIaDmQ0G+VztG+eR74/3DPk7ekY/uizAaZeSUv?=
 =?us-ascii?Q?9C7tr4H4reV4MephyNFar7mCkYOolMxANUD9D9VZYIkR7Tgt1VmXIXJ0Dj7a?=
 =?us-ascii?Q?+L3MOmPUC80YtOxCSAxiGKkhD/qcMSI07xQMX9/02J8YeRqfoY9C3GHgbp7m?=
 =?us-ascii?Q?fYB/6XJCWgSdK2ruWkk1RfG/rggVy4V0PudVxXJjC7ToPaf8wKh0IFkT2QUa?=
 =?us-ascii?Q?7fA1z5f9H7agyJsO5M4SOe62ZoputTZrxGxNv/FAuv7rQg/ixKI1nZU7RkHk?=
 =?us-ascii?Q?CXxeSaClOiHIYnE2YfuPZgyWETasXrRy5PS4rzxs6239JcuRZNhhS/u8lNW3?=
 =?us-ascii?Q?05P4Cka7rjY6l3DWCJ29VuqMVfWqY9nfedFAREf7hwjo5Yd1LW6HwTmo7+Df?=
 =?us-ascii?Q?p/VOovdGvQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: ljUeRtyT/h7nov1hDrpc59lsWb3L3W1nkzc9uCSLoqspgtahA4WdAcEk06te59d0MXx6vOD2OqQyzYirgX8+tc02f1Vgt/WD0WCb2g8+lKEplP58dIl7e2nIL/XUFVmlAN9Pa69pf5sdtDX0h4hpcWkwr8Da7dLD4RsGQ0K33cpOaVzeN1rzINsbQpqPKivfu6o24Aqg/tZKCjZo4jZn2gJlM6lvaW08blRUxTB9IPu5HROFPAVEqbjAWUwPc/HL3tcbxBLawpn3+ojrsLVYWVlWxdSmAyJIGTkszguMqmI+hgQjtgWSeM01QOGc6FzFtHEU21NYjIuLn05JZMO3Rg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 158cf6c6-7899-4ef0-2865-08df286668a9
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:40:42.0958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z236M2WduPP44DJ4Wx6jMKsfVxzUsUGvBcVdNlQrOLvrjVsv1/NddIA44nYZvhgOMqH3TCwOd8TxZW4AKHP4Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6501
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Oct 12, 2026 at 08:38:16AM +0300, Kandpal, Suraj wrote:
> > Subject: Re: [PATCH] drm/i915/pps: Don't block DC states while the VDD
> > override is held
> > 
> > On Mon, Sep 28, 2026 at 11:44:13AM +0300, Kandpal, Suraj wrote:
> > > > arun.r.murthy@intel.comm; Kandpal, Suraj <suraj.kandpal@intel.com>
> > > > Subject: Re: [PATCH] drm/i915/pps: Don't block DC states while the
> > > > VDD override is held
> > > >
> > > > On Mon, 28 Sep 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> > > > > intel_pps_vdd_on_unlocked() takes the AUX power domain and holds
> > > > > it until
> > > > > edp_panel_vdd_schedule_off() drops it, panel_power_cycle_delay * 5
> > > > > ms after the last AUX transfer. That is seconds on a typical panel.
> > > > > The AUX domains now block DC states on Xe3p_LPD, so that reference
> > > > > keeps DC_off up for all of it. DC3co arms with a 1 ms put delay
> > > > > and never gets a window, and its residency counter does not increment.
> > > > > Nothing in the panel power sequence needs DC states off for as
> > > > > long as the override is held. Take AUX IO instead, which powers up
> > > > > the same well without blocking DC states, the same split
> > > > > intel_ddi_main_link_aux_domain() makes for PSR. AUX transfers
> > > > > still take the DC state blocking domain around each transfer.
> > 
> > What causes the continuous AUX transfers which leads to "DC3co never
> > getting a window"?
> 
> Nothing - bad wording on my part. Sorry. There's no continuous AUX
> traffic. One transfer is enough because what's long is the release.
> Ill reword the commit message accordingly.
> intel_pps_vdd_on_unlocked() grabs AUX_A, and the matching
> intel_pps_vdd_off_unlocked(false) only schedules the drop,
> panel_power_cycle_delay * 5 ms out.. AUX_A is in xe3plpd_pwdoms_dc_off
> so DC_off stays referenced for that whole time and nothing can enter
> any DC state, DC3co included.

I still don't get what causes the problem. Is the problem the problem
fixed by this patch that DC3co is never entered at all?

AFAIU DC3co should be utilized during frequent enough page flipping. I
understand that after the last AUX transfer there is a 1 sec window
where DC3co is blocked for the panel you mention, but there shouldn't be
AUX transfers after this 1 sec window - as you confirm now above - and
so during the subsequent - frequent enough, say 30 FPS - page flips
there shouldn't be any - AUX or other - activity blocking DC states and
so DC3co should be still possible.

> The override  needs the AUX well powered not DC states blocked - which
> is the distinction the comment in intel_ddi_main_link_aux_domain()
> already makes for PSR. Transfers still take the DC-state-blocking
> domain around each transfer, so nothing changes there.  Also Ramanaidu
> observed on kms vrr @lobf-dc3co subtest the dc3co counters stopped
> incrementing, they were increment prior to commit mentioned in fixes.
> The patch provided seems to be fixing these issues.
> 
> Regards,
> Suraj Kandpal
> 
>  
> > > > > Bspec: 49277
> > > > > Fixes: 2827c44f148c ("drm/i915/xe3plpd: Map AUX power domains to
> > > > > DC_off")
> > > > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/i915/display/intel_pps.c | 21
> > > > > +++++++++++++++++----
> > > > >  1 file changed, 17 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/i915/display/intel_pps.c
> > > > > b/drivers/gpu/drm/i915/display/intel_pps.c
> > > > > index d4c98b150fa2..bdbaa10bce23 100644
> > > > > --- a/drivers/gpu/drm/i915/display/intel_pps.c
> > > > > +++ b/drivers/gpu/drm/i915/display/intel_pps.c
> > > > > @@ -11,6 +11,7 @@
> > > > >  #include "g4x_dp.h"
> > > > >  #include "intel_de.h"
> > > > >  #include "intel_display_jiffies.h"
> > > > > +#include "intel_display_power.h"
> > > > >  #include "intel_display_power_well.h"
> > > > >  #include "intel_display_regs.h"
> > > > >  #include "intel_display_types.h"
> > > > > @@ -734,6 +735,18 @@ static  u32 ilk_get_pp_control(struct
> > > > > intel_dp
> > > > *intel_dp)
> > > > >  	return control;
> > > > >  }
> > > > >
> > > > > +static enum intel_display_power_domain
> > > > > +intel_pps_vdd_power_domain(struct intel_dp *intel_dp) {
> > > > > +	struct intel_display *display = to_intel_display(intel_dp);
> > > > > +	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
> > > > > +
> > > > > +	if (DISPLAY_VER(display) >= 35 &&
> > > > > +!intel_encoder_is_tc(&dig_port-
> > > > >base))
> > > > > +		return intel_display_power_aux_io_domain(display,
> > > > > +dig_port->aux_ch);
> > > >
> > > > Seems like this is something that the power domain framework should
> > > > take care of instead of hacking together locally.
> > >
> > > Actually it does not at least not for Xe3p which now has DC_OFF when
> > > taking AUX domain, Because of that when PPS take AUX power domain it
> > > also takes DC_OFF(exiting DC states) which is not required And since
> > > it keeps the reference for longer than what a normal aux transaction would
> > DC3CO does not increment its Counter.
> > >
> > > >
> > > > Cc: Imre, which you should pretty much always do when doing anything
> > > > related to power domains.
> > > >
> > >
> > > Sure will keep in mind going forward.
> > >
> > > Regards,
> > > Suraj Kandpal
> > >
> > > >
> > > > BR,
> > > > Jani.
> > > >
> > > > > +
> > > > > +	return intel_aux_power_domain(dig_port); }
> > > > > +
> > > > >  /*
> > > > >   * Must be paired with intel_pps_vdd_off_unlocked().
> > > > >   * Must hold pps_mutex around the whole on/off sequence.
> > > > > @@ -760,7 +773,7 @@ bool intel_pps_vdd_on_unlocked(struct intel_dp
> > > > > *intel_dp)
> > > > >
> > > > >  	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
> > > > >  	intel_dp->pps.vdd_wakeref = intel_display_power_get(display,
> > > > > -
> > > > intel_aux_power_domain(dig_port));
> > > > > +
> > > > intel_pps_vdd_power_domain(intel_dp));
> > > > >
> > > > >  	pp_stat_reg = _pp_stat_reg(intel_dp);
> > > > >  	pp_ctrl_reg = _pp_ctrl_reg(intel_dp); @@ -862,7 +875,7 @@ static
> > > > > void intel_pps_vdd_off_sync_unlocked(struct intel_dp *intel_dp)
> > > > >  	}
> > > > >
> > > > >  	intel_display_power_put(display,
> > > > > -				intel_aux_power_domain(dig_port),
> > > > > +				intel_pps_vdd_power_domain(intel_dp),
> > > > >  				fetch_and_zero(&intel_dp-
> > > > >pps.vdd_wakeref));
> > > > >  }
> > > > >
> > > > > @@ -1064,7 +1077,7 @@ void intel_pps_off_unlocked(struct intel_dp
> > > > > *intel_dp)
> > > > >
> > > > >  	/* We got a reference when we enabled the VDD. */
> > > > >  	intel_display_power_put(display,
> > > > > -				intel_aux_power_domain(dig_port),
> > > > > +				intel_pps_vdd_power_domain(intel_dp),
> > > > >  				fetch_and_zero(&intel_dp-
> > > > >pps.vdd_wakeref));
> > > > >  }
> > > > >
> > > > > @@ -1336,7 +1349,7 @@ static void pps_vdd_init(struct intel_dp
> > > > *intel_dp)
> > > > >  		    pps_name(intel_dp));
> > > > >  	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
> > > > >  	intel_dp->pps.vdd_wakeref = intel_display_power_get(display,
> > > > > -
> > > > intel_aux_power_domain(dig_port));
> > > > > +
> > > > intel_pps_vdd_power_domain(intel_dp));
> > > > >  }
> > > > >
> > > > >  bool intel_pps_have_panel_power_or_vdd(struct intel_dp *intel_dp)
> > > >
> > > > --
> > > > Jani Nikula, Intel
