Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BCACD343B
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 14:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309C610E2B0;
	Thu,  7 May 2026 14:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UC+LQ8LM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6A010E2A6
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 14:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778164840; x=1809700840;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=X9EXVoQaEEU03NQmqklx7QDmZsuUVuPVtv8XUoTcl4c=;
 b=UC+LQ8LMnEMAhtU/0qgV1VdP0/vrK1iHdZcZpAF5ietPI9Vd+BxmBInI
 dkseVVidoiQW/vAYlSf4Fn8CrZeVzxsDBGXC5lIvOToxCnLdsd7q8cCc9
 KfvrOj2z/X+u/N9WRm/LckmLvdJoLI11ZfC6oGa+4FpEpYsHHAE5TRcFu
 soChraNhnnPCRkc14rwlILP9bKC6tYH2lqiyqN0Ax8mZQo9XDhsiaoJko
 fXi41gZNHzH3BDmTlRwm4lIv0Sz9R1pnsjbUKr+KSDvZVNnoS3saDXvHL
 4ER3V3LGdodu2IbWrBgFGFEAZatX+stHYX8Iku5PDtx6W7XXJuKdMLdOj Q==;
X-CSE-ConnectionGUID: LO/eHelFQkuhmzlHOBH3VQ==
X-CSE-MsgGUID: sgHdwOynTJa9boRLhcHJ4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="66643881"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="66643881"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 07:40:40 -0700
X-CSE-ConnectionGUID: AeK+pOjKQayfwsf8lfYMaA==
X-CSE-MsgGUID: a8KIk1ltRfK5JMYQmmlspg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="238282645"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 07:40:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 07:40:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 07:40:33 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 07:40:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3WboC2JU7dJXuoJCPvrFONdRl9/zXowVD0XSZ7uvf4iE+gn8CGf4IVYiAKG4ghh+HugX+9LX5JR3b6RDzW59D7jU8INeYAdQrPYWW2a0aPdJmN+7Q8Fh1+LKl8JQlEedGe0y7BMVBepwbHtX/H5i0Sgv+lODyKu0Gb4/GeqBnb4A1nP396l0iyaUNRurO/8YE8DnmD4/nalrQhHhyXluJkBDkL+QGDYj10AOiUgMehNRa+yCUor7sRbijF3jIIVBZ2DLwFSmNV9F5wc4YXkA3I7zoeWO26b2Hc8ppdBV14tLO6ffcC4UE+J89U1TTYUuK8Ez5hMljhYVdc4Dok9MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YT5+9yWFNwOPasl6cuTrK+RRYEW+U4x9aE3SjHfjlk=;
 b=I+fFcoNEWmiySX8otAF3qi2x5q8zk4VjgfV1V12dpKR8sMe3SKaGkWlJX6prmJzeubdkHLM073bxJmGS4fIOFfU5x4/q5ocmoWbBgJY/F0ztY9OPALJzu2oLooNbRMXi13UsLxzrfzNWkGZW0+KTqBruZlP14hLcKukWfVF2tngjxTG3fv/VpOJmojS5T65CTl+WddlVSw+shlSzRHtqEyIyLn5tbxMPomXTXCTr44P5fFeOKDtG+ks09OvdpUye/9qihoc7IDQtYYgSjnOZ6h5UvdaRrEyrxEn7zMszJvema7KPUEHoavgiYzqTScQmZaI3SQI18T4lHKZo8EeljQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA1PR11MB8350.namprd11.prod.outlook.com (2603:10b6:806:387::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Thu, 7 May
 2026 14:40:30 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9891.015; Thu, 7 May 2026
 14:40:30 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: James Xiong <james.xiong@intel.com>, <intel-xe@lists.freedesktop.org>
CC: James Xiong <james.xiong@intel.com>
Subject: Re: [PATCH 1/1] drm/i915/dmc: fix assert_dmc_loaded WARN during
 async firmware load
In-Reply-To: <20260507004631.574300-1-james.xiong@intel.com>
References: <20260507004631.574300-1-james.xiong@intel.com>
Date: Thu, 7 May 2026 11:40:26 -0300
Message-ID: <878q9v8eqt.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::37) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA1PR11MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: 0984244b-90e8-4252-e2fc-08deac469600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: vbpwuTis/EgMMsdZTZgSxzQ7qLzxkgfErBMktSy/WHMg0kTFAWVxJOLM84at85ppOxxjhtMD+Wafla+3vQGt7RKPN2i+yr1i4PPgIJhV95Ept0lw1aotRvm7691NrilpOALNAREMl8oAyJc4nDfqtXtupZMZBm1PQF0FBlYSimvyJwT73pm79JKx6ke9c7qPGoePa/YOez7/FJpfC4bwh1Oe1M0NV3Mk3GzF6hSK3d8Ov7wnH5wgcEiL9/w7viiYzb7zA3Hc21sp063LAAZROMr7R20V3Knmjm4ntDFdvcedzEB96CLHpgM7706aLXSjAaZrtFbQamqLpQDEATUfTzDT50YJ3mbrqmGtnjliVG6wimFB19mf+rbazS3S0h6HmV+4wg3+Yr7hoX68pCs0dQN8vrGH26S2HMbBjN9wdhWdM5CO90IEWLDCo97MR7+748rk2l/d8qksTexF6BTfsM7Q9r6wfG5mYbzQF2++qzGbXfXtiba66UeRe1RD0zOpZIoGZ95hYwLidJYnh7DurvHADdaLCP7XBgQu1IYHIuZxTouyj4CL5L2d4krnbnMdjBrFgOQiDhbbNzVfy4iK85U6+aLbY4SDuQW84J/6KdD9p/UaQsr7hTskoakvAigItSpzBrPvrz+VBoGzoUZmhK1wrmKDiHPMOuhVqk0kOuqeLOut2y9i/crEwez7A+nc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xGXpgrI40w3hx9SQuNQhSZIP312g0L8j1G9LBZl80q0KPhyOuL9Tg07eLpPs?=
 =?us-ascii?Q?qadwhHqYrp5BG73CAizT4g2hCSrTDpO/CEsP8pt6S9MDLOkpWr3zUOheOSSe?=
 =?us-ascii?Q?6SZ8yZp5waXx5fTy2nWbbxl2nKyFyH3mr39a3n6KepS5VMgGeVW6ABiPrkqi?=
 =?us-ascii?Q?Gw1K56ZqeLGbe+vgE4P6GZgpK7XvcaFCcI6EvjwMTmQrihgEAun4DgGzrUau?=
 =?us-ascii?Q?x9KdlLsDUeJMqDX0yl57dyn0qMqG17ipc9q6HvloiAl9z4ADNdrUPlMs4jP2?=
 =?us-ascii?Q?UY7YF9JDWpEauWGXEFrhYekapF3XugFm/Xvg1cz/Z1GUj5pINwgMr5sTiFkl?=
 =?us-ascii?Q?cZSpLxt5hMYMp1qnrPafiNcEe8CdhpVToZhQr+iPe29tBBDu4knJNN8x7rL8?=
 =?us-ascii?Q?Ouf+h4Sql8UofMdkLhgs4aSQwFXP3uf3ShahXMxPEOwcj1gPaR/Z+Vd1IlPq?=
 =?us-ascii?Q?DW2tZJD7SVNu7Yg7yoFgl1B9u9QuaRVfOd3fRYvzTqCdv909CXRB1jshjk7L?=
 =?us-ascii?Q?9AdUJVxThs69WJC4MmKq8hu7LE3BCOTFGz9Ium4k3AKBz5Z8n27pVaCGnLOW?=
 =?us-ascii?Q?EP5480Oi93ovnddAfnu2zvyYapC9+dfF5RipvkQvBI19H0BTj4Jq6sRnqVhO?=
 =?us-ascii?Q?iO2B7rjEnBlAwUztRHLMG4leYA6SvSgLjdr1kDf1y3r+2p9ANZCEs6bv9iuu?=
 =?us-ascii?Q?W+jKXsNaWNtQ7hlL78ls8WEec2PHzA5V5TVVgmsm4i3I5ABBEeGjnEsO5Md5?=
 =?us-ascii?Q?vjnlvQ2WUv9MkBJ7PK6ZG8e9Ky9oBTF9AVgYPYqomChHQlrJJeHjPHh9PCru?=
 =?us-ascii?Q?MKIzE4qexXN2qotC9ur2ks2abNMoEf+tPdgex19+qLaAyxdWMioINRW5VEOR?=
 =?us-ascii?Q?uwASFYsjAc++kMDcmO1ILgend7BxrPNGJtfwVVBbokzI7UxduzTetkFOC/Is?=
 =?us-ascii?Q?DPvrVQ6Qm4KgExTcSZD39S56gqNn2R0LwTS/oDil7nRmECBtzrkkX5lkjCod?=
 =?us-ascii?Q?BkhwAUL4lry6U3Mr8ofv7bvHeEtG+wJllkz6eHZ0cJbmU81I9gTEQBLJ/80q?=
 =?us-ascii?Q?76M5LF6xEV96Him0mrn4uq5tlhm0nsGZ/4whTAjWEX4ZT9tQeOgh34/I3j9F?=
 =?us-ascii?Q?yzMNOOZOo86mZ/KchdRMZ8BUZZzyLfMEFEczDx7CrgGCZzi+XxY4++KAvL0V?=
 =?us-ascii?Q?YfPN+YpGN8HWfY337t0lM2KT2b2Pa07tWYIZm66Jn0vHV9YjirYgBflbreZH?=
 =?us-ascii?Q?j37J2bqUlh/2nC8mfgHTxoCUlQthjMUuhJf+yzyaC8Xv4BhDsqYt/NV4IZzN?=
 =?us-ascii?Q?WV3RqG+wHqiUo2UAdVoD4oe+Y7Hs/ybMZ9bIBaeufglyWHwEKDRSw8/WaeZ5?=
 =?us-ascii?Q?D1sMGmdu5uuTU1HQOdFirfc+bQFQaVJn/ort24wKw9xRI6tDbMHH2tGk86wo?=
 =?us-ascii?Q?f6NnXnKFZSnsW9/LnrmGFfSQeYxQG1PnoS1LrMxYZVkPeDC/pe9a0U2jwnEr?=
 =?us-ascii?Q?6U8fnFZZmBnX5rb4JD2JY6deT5xML9W29dlNY0xCI+SXDaoz/0NLalHhclda?=
 =?us-ascii?Q?fHo8h6wD/+kqP9gxOlvxKR8mWU2a79ajaRx3sfGT72igQ9Ha72nFsDFxcVTY?=
 =?us-ascii?Q?0W7k8DLypRcR4n6Q1uQS6mc/CYG8+BCWtw/bgSRuRvLKW+vYUK4M4fz+0erJ?=
 =?us-ascii?Q?wLQPqsnlZ5FRo+nCayNvnIjiV2LYgaw8gHOvvFkXdad4dxpaLdHk+/hq3lNE?=
 =?us-ascii?Q?PLDPAtWNQw=3D=3D?=
X-Exchange-RoutingPolicyChecked: XJtmtASnPOe9zxzqLpYc4heRTN8QfqEciNAhdKxvlDsQUJuV7n428LM6icUEZ+biQ0I2nDjIVQNHbifMR1StCr4XSuJI5KicSQTzRII01BK7DN+odxBiARxDBXnnRyCz0Td+Z4z777pxknVzYK/x2QvbZXVxUd1HBY9Gblplz592+3/L/wMlivYjVxhUSQvOoGnT+KLcyF0JtwJY5MC81FPcOQtRXdNusQokGrCfNCYcJ1ysiySDwPPbj+6dj5+mYqQ1Ah2KviZjIwI7ed6CkzjJ/+UWNyau8TROeSYhcEbtDgZyCSlyPof4LQ3grhjYLv6vpUB9Xq+p4EZdN6tmBw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0984244b-90e8-4252-e2fc-08deac469600
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 14:40:30.0446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uoq3cXgEQiymq1ZaSVvx9z3Oc6jWo+tH5rXjImBR05f8XiCUjCLF+xt8VOLLbleikZbCGgyrlo7cpGIdt6QPSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8350
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

James Xiong <james.xiong@intel.com> writes:

> During driver probe, DMC firmware is loaded asynchronously via a
> workqueue. There is a race between parse_dmc_fw() setting the payload
> pointer (making has_dmc_id_fw() return true) and intel_dmc_load_program()
> writing the firmware to hardware registers. If the probe thread calls
> intel_dmc_enable_pipe() -> assert_dmc_loaded() in this window, it sees
> parsed payload but stale HW registers, triggering a ~20% intermittent
> WARNING on ADL-N warm boot.
>
> Fix this by adding a 'loaded' flag to struct intel_dmc, set with
> WRITE_ONCE() after intel_dmc_load_program() completes. Check it with
> READ_ONCE() in intel_dmc_enable_pipe() and intel_dmc_disable_pipe()
> as an additional guard before has_dmc_id_fw().

Making intel_dmc_enable_pipe() bail if the DMC is not yet loaded doesn't
look like the correct solution here.

Does the warning come from intel_modeset_setup_hw_state()'s call stack?
If so, I wonder if adding a call to intel_dmc_wait_fw_load() before
iterating the crtcs would be a saner approach.

--
Gustavo Sousa

>
> Signed-off-by: James Xiong <james.xiong@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dmc.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
> index 0df4f42ba3e3..c51103515820 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -79,6 +79,7 @@ struct intel_dmc {
>  		u32 *payload;
>  		bool present;
>  	} dmc_info[DMC_FW_MAX];
> +	bool loaded;
>  };
>  
>  /* Note: This may be NULL. */
> @@ -417,6 +418,13 @@ bool intel_dmc_has_payload(struct intel_display *display)
>  	return has_dmc_id_fw(display, DMC_FW_MAIN);
>  }
>  
> +static bool intel_dmc_loaded(struct intel_display *display)
> +{
> +	struct intel_dmc *dmc = display_to_dmc(display);
> +
> +	return dmc && READ_ONCE(dmc->loaded);
> +}
> +
>  static void initialize_stepping_info(struct intel_display *display, struct stepping_info *si)
>  {
>  	const char *step_name = DISPLAY_RUNTIME_INFO(display)->step_name;
> @@ -786,7 +794,8 @@ void intel_dmc_enable_pipe(const struct intel_crtc_state *crtc_state)
>  	enum pipe pipe = crtc->pipe;
>  	enum intel_dmc_id dmc_id = PIPE_TO_DMC_ID(pipe);
>  
> -	if (!is_valid_dmc_id(dmc_id) || !has_dmc_id_fw(display, dmc_id))
> +	if (!is_valid_dmc_id(dmc_id) || !intel_dmc_loaded(display) ||
> +	    !has_dmc_id_fw(display, dmc_id))
>  		return;
>  
>  	if (!can_enable_pipedmc(crtc_state)) {
> @@ -821,7 +830,8 @@ void intel_dmc_disable_pipe(const struct intel_crtc_state *crtc_state)
>  	enum pipe pipe = crtc->pipe;
>  	enum intel_dmc_id dmc_id = PIPE_TO_DMC_ID(pipe);
>  
> -	if (!is_valid_dmc_id(dmc_id) || !has_dmc_id_fw(display, dmc_id))
> +	if (!is_valid_dmc_id(dmc_id) || !intel_dmc_loaded(display) ||
> +	    !has_dmc_id_fw(display, dmc_id))
>  		return;
>  
>  	if (DISPLAY_VER(display) >= 14)
> @@ -942,6 +952,8 @@ void intel_dmc_load_program(struct intel_display *display)
>  	gen9_set_dc_state_debugmask(display);
>  
>  	pipedmc_clock_gating_wa(display, false);
> +
> +	WRITE_ONCE(display_to_dmc(display)->loaded, true);
>  }
>  
>  /**
> -- 
> 2.34.1
