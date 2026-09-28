Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C79DCA5FA3
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 19:40:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A88D10E961;
	Mon, 28 Sep 2026 19:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXY0KMn/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4879B10E961
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 19:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790624408; x=1822160408;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uqHg+IEz1tEv9taog/nV6lj8V+Hp7kmGe/1LPAVh6qc=;
 b=HXY0KMn/angIQIzrVZx58oNf4kICo/OFX4RIkLUB0jcXK+ODo4IUbuZY
 4FOFsF1mR+hdtGal5Xoyv54Z79A3wobcPcRe7ZuyUg9qyKdRfqpLlkmjP
 wKUb5cIJ1xUzk3utaZrH7dH31cB8qgNS6beCvlTEuI76LSotGzvpQnbWb
 M4TGOJU9T60XA6uKIhBTRarnOkDHsvvH++MkPsp8bJxRo/zrnzYgNI2ZP
 lVCI501MkljRhOAQz+C8YwaufAdDqeoAd9feYcZ8vz9U5OeMd0qMbkiML
 FrzBaiCGnc4LS03Za5g8WrNCBgp6alq44kFE3AD7QStHpt80FlN1Z5APy Q==;
X-CSE-ConnectionGUID: 9GH/DDYcRiewzvs+vmmUuA==
X-CSE-MsgGUID: LkTsqExURrai0qHC8Lt72g==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90376333"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="90376333"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 12:40:07 -0700
X-CSE-ConnectionGUID: wBTKJyYhRd2ZFyQrThvaOA==
X-CSE-MsgGUID: g9YWBdRMRU6+EcH6mIv8Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="275264367"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 12:40:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 12:40:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 12:40:06 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 12:40:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JpZh+m6SCdjZ4gXJ6M/PXgguYxJeViZoxQ6doAA74Nc5JvYLd7Ma3CM08WYAKN312VHPihRtL3/0NeHk14TxXZQodvoGFUQ2VGx8VOTBfw+vebNvkAoRH7E8XhGWJh/Z3Wx7OvJX5VJqrxokD6EmUuGtFod8DHOxvQSYFPWk4/6iUkF1dmlwggOdnQn62a5hA3rSX8Em8dmLcp5SAUR59TkHNQiy2C3gH2l1qsmIUONSp8RUI2I1IFc0D9jH1Gz3vHdEVv45ZFIqndI2MPQyLxx51YN6dP3nPp7ZHICoYwWJvPdVglOToFzZGlysuOEs77V8tCpImOaZIck3ZD+ZDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrOawcpgcJf6Fnqg/4FYixTV/QOe/3OlV74CSP0d3t4=;
 b=VY7JTtVMu2ELQLPhMYzrctuVlioadF7dyAr/1bVEhyG0OekpR+cuHJqWItcqdx7eKiFDKeYuAp7VcxSJA2dgVIrQPLBRICKHBGPYFUflLWNQ7sPWKMEbLCdWgu92D7adjLXIbMB0oP7srjadpr0lGy4XKAWED9H9SSWsP3C7rS6pq4+tUcgGmwJE3We8qyvtu8I3FNRoEr9T7rsF6Xem6GBuUkMvFfNcmXGgIBWKjI5Zf43KbkuIW9dyFo3JskmH9rmacY655TcSep7xjf5G/mjF8ekIhzvWCFEXIW0NVddulggANQ8Zboatd/jJ3I8vZ7EmyDPZOow8bY/ntJEJjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DS4PPFC222DF22F.namprd11.prod.outlook.com (2603:10b6:f:fc02::4a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 19:40:02 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 19:40:02 +0000
Date: Mon, 28 Sep 2026 15:39:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v6 07/13] drm/xe/hwmon: Consolidate temperature sensor
 availability checks
Message-ID: <arrChCQJcyRAfpMS@intel.com>
References: <20260924205429.2846256-1-karthik.poosa@intel.com>
 <20260924205429.2846256-8-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260924205429.2846256-8-karthik.poosa@intel.com>
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DS4PPFC222DF22F:EE_
X-MS-Office365-Filtering-Correlation-Id: 50502b13-e504-47a6-d8c0-08df1d9849ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|6133799003|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: e5WFzk6B4Qg0Yf0DoRjP2bWbT+MtXcGyWkjJtPgi2KsROzKWLIpO6nDD5FwWiSKPJCpCzUy6nY1mM9DHwYVReIOOj/gz5EzEYsOIc5Cm3BZuAS3wWYnlGy6wfz1MQWqULKRdXPdfbGjvlEinXSo+k4LElb48/3IU0F4+RTxZcsW4riwirSenGUscdwuUtvrGWgEyP4mUClPmJT802TVsQmM0T5MhWLpSOaluO0lSWJ1QumeJHkkq4SQjcbnk1iPxXTO07frHF8ZlypT1fgwSayXit9yOF1Vs/NeEHoYeNf/KOzK/sKk5Nf0PGaIPj2Fitwkph0IrSY94D5G/hmRioEppuJSZI5La9ZATuqYndTMv+qVdUKA6u3CN5bXmBx4H4/q3WAJx1pVutPiXZab6k8YNBQyOnwiAF8umJccGUBwsVGmosqkZfHEC5EmFrsN8s6fxA4VYoePrX7fZyr9p661rWI4EEB6eftEVpgVTpAKjJxF2t3xMPl8CKXxHwc3BNHwZTxAFaj+aj27GsUxHjsCB3JWsc8L0hXP2UUPmqjreBNyChbfzDCi4iFlovURWBMKQm3cA/4R+DHlYiTC0jp4nBmEMJkVw7I+bjKBRXIh9FlHdWQCBmnFwoMcV7DBe7uI4gE2XbOl6p9qKez2n8JGKUph2wNNL6k68LVnik+8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(6133799003)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i78BTFwa8wzvc58rh/dyCFk/WmYVvMaMyZ7tTVXWxjnH2emnfJuMxl8wDCMR?=
 =?us-ascii?Q?pZT86vhtPTriED3iOIbyv1WdBDbh57aKvfVNrt5LpCBW0aV1BUHirmgdmtwR?=
 =?us-ascii?Q?gU+yzP1qpZSdy7g2GS9CWUJ6ObmthpuBcaj0JqDSIB4/HazjodjpoUaUziYK?=
 =?us-ascii?Q?vXnucH7WisP9EbUadWBB2m6rZfDPA+UeHGt+F47xRFp+hhaFhTD+pcvx9sT3?=
 =?us-ascii?Q?IAQwg9znjuQuOTio36MgzS0ZOqM6WWWNtAj4VCoue77uGlxzaho3P9bvq859?=
 =?us-ascii?Q?vNsc9//+4yF00gN2UmIRCVUd2Gx0P09KSHFPnzvSdQwovVwY0RTGhvOxiMfy?=
 =?us-ascii?Q?Fyk5ngHC5NXYGIs/SQlYO2l7uc6ansvnvweOLBKrqoVXZVdQceJe81SeOxq7?=
 =?us-ascii?Q?2W2Z5OYM9F1Do8GRzyGBZQQKY9O5GeaSL8dvtnJx8i3dlJg9iC1+4btYxSML?=
 =?us-ascii?Q?Fl6Sy/59LuoXrj2c4ItYKnVOiwWDbc5LygD+hM/NZFr6Xb9dozrZPcUx1w0h?=
 =?us-ascii?Q?owkzarVndj+uf2fM6mq9VZa7RbwTn8toD6PjPF4v0PET/zKTwZT3Z2sdmQcT?=
 =?us-ascii?Q?PVdr6nIt8UbNY53iWADmJxFRXJ5iastNwT0yiETKkg6nxGlNUD4i+NutSVex?=
 =?us-ascii?Q?TH+77kJNREAg1vmvjfJJmTr6zTVC2cfwBdRzDwx0gyMhoZlawc/TUSj89KvK?=
 =?us-ascii?Q?O7LtlD4X7gEouZLUCz1sGzmla7aCt1+6Gdw3qhnAa4Uu9koNuvqrPaZ5sZ6W?=
 =?us-ascii?Q?XhufIlVDcjlMwsEe9J7Pg25TH06ljS1gxFV/327cVb5C1663qZK2JmwgqdqQ?=
 =?us-ascii?Q?L8NNSemkxgewgehEfSmih7zQS8EvjEZiVUQt/G/Uzr/UkXkUU2ZzRK5Lh+pi?=
 =?us-ascii?Q?6nJr3ZEOrgCi/gEsC0H3zfjreV2PbpjDlivIEGPpvQ64rWEONLuXxLrvyaVv?=
 =?us-ascii?Q?gbQUH6hFuyB68vONJG1TvX85sDM7zcu3nKyuA4d4VqYFM5lL2pZwn9+yPqHF?=
 =?us-ascii?Q?RWLAvDbczUIoldk87pbCKYu2jYd3hvoXYULHonGJH/r8vx7Y4HZHFyDlHomR?=
 =?us-ascii?Q?wVEopcKOFPnQiaRrqcNGHLG7KqzVdikomOFukyw9/nHIPbrDNx9CQwjLr7J3?=
 =?us-ascii?Q?hV28/UDLtlTc59uX9BO2yFj/sI0wyFnY//WeBwZFQMpnEE2WrXc5JSCwEpWj?=
 =?us-ascii?Q?2uWzX5KpoW5eQdHUqEIfldZfOAScI6oHzcDDsa8SX0iNzogD1mCjCnPSs9Iz?=
 =?us-ascii?Q?yBJiykkyH/izmkCw61fd8blWJpMP7Td0pTNf+A4794PrGADPqhG8m8Py0Umj?=
 =?us-ascii?Q?cgP0iQ9pMU4bytfS5nBcrEDL2lcvtc88VZMiyLGEQ8vPa9nrU7hz0MLagXH7?=
 =?us-ascii?Q?ifVbCos3m4Wd0eE+KE0YmOluuc2ukNmH4FQHvm+PVilaViy9uULMD9NEgRAe?=
 =?us-ascii?Q?fYGq4W72o4tdAUnOfWDjlpKivnEmqLuVDGhVAozfJTk4OcatyLYQY2Tcj21G?=
 =?us-ascii?Q?/Y3V/QWnv57THGjnAdRW971OdgoiRd6EN4ONHlGFzpCfwjyxC4ldUK6JKrX6?=
 =?us-ascii?Q?vtEOCiRPfGCKSzohtbo4KBU2P+9AcBZ4zIBCYNT0VpjH4TAirCa1btfV/H1u?=
 =?us-ascii?Q?9WZ5du0dD/fGEpD66bSp6Yg9jACr5Gm+3IMNSbU69UQVB48PEwKiDVz7GeUy?=
 =?us-ascii?Q?yd3OouzQawqwlT4TPfcOMHzsnpPNRbKs0U4wMnv7Nv54rAMsGnl6t+Bl6Rog?=
 =?us-ascii?Q?UaonGjIVfBCR6Fh+hN3MPh9f65OLs6Q=3D?=
X-Exchange-RoutingPolicyChecked: mcgpecF8NLcWmsUInatOiYuZkEzu590cfR3sshCEdKRDF3kiuAn0meKUwdHBic9sxWypJwMQMyyBXlw8q4U/i7ImRqj4hu6ck364aVwVJ9xEKjb1jq6p1hIsFdN20G6HJiL/4f3bx3s2/6nDIYqWcig+Z7Dp42DjgQL0MLr3/XHkbfy5S28u/h0j2SZNadg+vaNhN1XbJQB9Q5BgwN3RedlQJ8K4JBi2RioRqdX4P1NFrB6b1LJw6ZRQZO9MqdrDZNPYXGMXJfP7kbT14D3dqCkDs2zB6qgj3rhZIWbAynQacAaPQVGQUaeoe3Htmp1nnU2wPNvPYSwkRRw9wtEZMw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 50502b13-e504-47a6-d8c0-08df1d9849ab
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 19:40:02.4838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GtcXWqv512Ds/Bd13w2D+DNDE29h0ngSbJnnQ8pbHcDuDHRvEhjT8iDvTEyseiegx5AWtsMebw9lTxIJC8BKZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFC222DF22F
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

On Fri, Sep 25, 2026 at 02:24:23AM +0530, Karthik Poosa wrote:
> Replace is_vram_ch_available() with a generalized is_temp_available()
> that validates PKG, VRAM, per-channel VRAM, memory controller and PCIe
> sensors using the new validity helpers. Rename the existing callers to
> the new helper.
> 
> Use is_temp_available() from xe_hwmon_temp_is_visible() so attributes for
> sensors that are not present are not exposed during hwmon registration.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: LLM
> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 64 ++++++++++++++++++++++-------------
>  1 file changed, 40 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 4a7cf913e6c8..052b25a233d6 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -1002,19 +1002,39 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
>  	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
>  }
>  
> -static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
> +static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
>  {
>  	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> -	int vram_id = channel - CHANNEL_VRAM_N;
> -	struct xe_reg vram_reg;
> +	struct xe_reg reg;
> +	u32 reg_val;
>  
> -	vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
> -	if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
> -		return false;
> +	switch (channel) {
> +	case CHANNEL_PKG:
> +	case CHANNEL_VRAM:
> +	case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> +		reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
> +		if (!xe_reg_is_valid(reg))
> +			return false;
> +
> +		reg_val = xe_mmio_read32(mmio, reg);
> +		if (!mmio_temp_valid(hwmon, reg_val)) {
> +			drm_dbg(&hwmon->xe->drm,
> +				"channel %d temperature unavailable, val 0x%x\n", channel, reg_val);
> +			return false;
> +		}
> +
> +		if (channel >= CHANNEL_VRAM_N)
> +			sprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N],
> +				"vram_ch_%d", channel - CHANNEL_VRAM_N);
>  
> -	/* Create label only for available vram channel */
> -	sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
> -	return true;
> +		return true;
> +	case CHANNEL_MCTRL:
> +		return hwmon->temp.count && !get_mc_temp(hwmon, NULL);
> +	case CHANNEL_PCIE:
> +		return hwmon->temp.count && !get_pcie_temp(hwmon, NULL);
> +	default:
> +		return false;
> +	}
>  }
>  
>  static umode_t
> @@ -1024,14 +1044,13 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  	case hwmon_temp_emergency:
>  		switch (channel) {
>  		case CHANNEL_PKG:
> -			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
> -		case CHANNEL_VRAM:
> -			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
>  		case CHANNEL_MCTRL:
>  		case CHANNEL_PCIE:
> -			return hwmon->temp.count ? 0444 : 0;
> +			return (is_temp_available(hwmon, channel) &&
> +				hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN]) ? 0444 : 0;
> +		case CHANNEL_VRAM:
>  		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> -			return (is_vram_ch_available(hwmon, channel) &&
> +			return (is_temp_available(hwmon, channel) &&
>  				hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]) ? 0444 : 0;
>  		default:
>  			return 0;
> @@ -1039,14 +1058,13 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  	case hwmon_temp_crit:
>  		switch (channel) {
>  		case CHANNEL_PKG:
> -			return hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] ? 0444 : 0;
> -		case CHANNEL_VRAM:
> -			return hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] ? 0444 : 0;
>  		case CHANNEL_MCTRL:
>  		case CHANNEL_PCIE:
> -			return hwmon->temp.count ? 0444 : 0;
> +			return (is_temp_available(hwmon, channel) &&
> +				hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT]) ? 0444 : 0;
> +		case CHANNEL_VRAM:
>  		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> -			return (is_vram_ch_available(hwmon, channel) &&
> +			return (is_temp_available(hwmon, channel) &&
>  				hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT]) ? 0444 : 0;
>  		default:
>  			return 0;
> @@ -1054,7 +1072,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  	case hwmon_temp_max:
>  		switch (channel) {
>  		case CHANNEL_PKG:
> -			return hwmon->temp.limit[TEMP_LIMIT_PKG_MAX] ? 0444 : 0;
> +			return (is_temp_available(hwmon, channel) &&
> +				hwmon->temp.limit[TEMP_LIMIT_PKG_MAX]) ? 0444 : 0;
>  		default:
>  			return 0;
>  		}
> @@ -1063,13 +1082,10 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  		switch (channel) {
>  		case CHANNEL_PKG:
>  		case CHANNEL_VRAM:
> -			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
> -								channel)) ? 0444 : 0;
>  		case CHANNEL_MCTRL:
>  		case CHANNEL_PCIE:
> -			return hwmon->temp.count ? 0444 : 0;
>  		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> -			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
> +			return is_temp_available(hwmon, channel) ? 0444 : 0;

now, if temp = 0 at probe, then it won't appear. What made me to question
patch 4 again...

But other then this, this patch looks correct:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  		default:
>  			return 0;
>  		}
> -- 
> 2.25.1
> 
