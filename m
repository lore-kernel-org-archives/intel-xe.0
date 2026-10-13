Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DF5CA9ED0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 00:50:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DA210E6D4;
	Tue, 13 Oct 2026 00:50:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4BB910E6D4
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 00:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791852618; x=1823388618;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1pcDzZW+JjljawtFvDLaeSwc3UBlpovjksgB+KXeJEo=;
 b=clXwsT92k9wzkA8uh/1x3CeSuQv88HZgsaec7/mOqVhkKNuTtlLPX4bB
 Vp9JicHJVkN1LynMAX6z74406QagifoEDKkZT9gA47hWl1b41EYUhCcPI
 Y7fg0T9JTQ6Ow1zUvPseETmFlOrOty2aETO/O5unJqd0LfX80AzPKm7QR
 FgcHmphjIH7cGu0KjXDxGAS6d6c9bvz5Fz0n+kz6S8ZS7TygqB5V2J7Py
 0Q8gr/a07nWTLELo4OCgsEt/aJ32dBc6UwMlmm2Lg44Dmjiw5ufpbqSP/
 1JLMifhgCjg67QsDvu+0lwT9FBFmCAbNHidfiDj5Is53Noy84dNSIZEz5 g==;
X-CSE-ConnectionGUID: 7RRuIKokSFmkQqX3ojPOTQ==
X-CSE-MsgGUID: De8A/6qAQMSFxYxiNXXfqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="574723"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="574723"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 17:50:17 -0700
X-CSE-ConnectionGUID: ArHD8Vh6T36tStF0HRthcg==
X-CSE-MsgGUID: HZwxXglkQXCBGEZotmp5BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1358842"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 17:50:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 17:50:16 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 17:50:16 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 17:50:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPvOk/06HhrLjPj8La1lDKU1igtgNTwyoOKjIvAvzxeOYBZ9oO/me5P+1R4OnuCyF4vGneb+iR6MWUV07wU2aWOcJSVWsJLYFwboTh7zTJnQJaOpKRiMx4hrtv/KVrpBglhRysgrnoWmPCh55H7lBOAsvsPrX+kMj2MShymeSxCsvEVmSJks/Py50TZjs5SnjAdPEJO8TLZqhpUAJOcPvxcSAxLt+ksvy3dCOKDggoKW+Ny/tUOy3vf4zc45VJem6HoklJD8/GVxOakt3vKzMTdVC34GSote3z2jkBCB+vOH4b2VqhEMaFaYeJmOW9KSABeXfAPl40hTcHfHXHii1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ViBULE7SGZT6JE6/sycTx/JstoSgZ3YAC+6aD4SlHYY=;
 b=Q4EYKD7dVDAclN+VkEwuAQ1fKAnQOoQvJkR46sWCgWXvNSs1qyz0FnonE5Yc/XXXbdhpRoSI67qhN2S0pWpq+ZMfwAuuEAj9JZhULd/wregLlqcHlBz9YB+0lzdzfok2wU5j65JPU8Pi4ZVNU7p1tVcoe/bTrUwpyfMU5cNl8FhAarrl66rQ0wCWmt5Sq4rbPfd7/AcXShJwgT3BEj5pJAijOeeOho05JmZok2KzyNAqcIUBU7kr2fF6iOKpwIn1gPTTeNUZseof4YXeiPr5lBYMws6NFc3E+XnPASSBrtly4uyNeEFdQCLwh23igzi61ekXWkOqL7HiD58iL1i5UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by BL3PR11MB6361.namprd11.prod.outlook.com (2603:10b6:208:3b4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 00:50:09 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.015; Tue, 13 Oct 2026
 00:50:09 +0000
Date: Mon, 12 Oct 2026 20:49:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v10 03/16] drm/xe/hwmon: Fix thermal sensor data handling
Message-ID: <as2AMp0S33sbCXGx@intel.com>
References: <20261012130401.443473-1-karthik.poosa@intel.com>
 <20261012130401.443473-4-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261012130401.443473-4-karthik.poosa@intel.com>
X-ClientProxiedBy: SG2PR04CA0210.apcprd04.prod.outlook.com
 (2603:1096:4:187::7) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|BL3PR11MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: 79c33feb-16e0-42f7-0a84-08df28c3edcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|22082099003|18002099003|10067099003|261009223027099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: QjwiQRwcgcSPXXt6NMuO5FACjUWxURlomoTyiRj0316zcWhaVq3Xg4jZh1DtdIA8j70lRFoKtotN70tqpBSLV4DAI+qmvtVCwHSmOaeDvtVoBgJ6w/j/k9To/aweflVBq38gsgZsF4xDW1ocTn6Yjg7ZyGJDm/CIBilcbolyjc3qPfvmznYJhDrW7pjF/6UvIT8OnL1aXGQPXSdwb1+aY4RvxgTxDT3+ugdYyc7KWI/u9CN9kuIYl3xtNSeJ0q2sy46CbcjrYuDhXdocvb4e0057ZSfAIFkst7kSnRhBbX2gyLsN1XlhYJFfRa2cB3krJ5GMupxcDFcNeeqKeIzL5/vPjvJVCEQ/KRhbJg2l8+GCmMa3ilRNP7LaOAqv4ykfq0LtqWpjbaW5LztojKcj3A3ImbgmuZsr1CGtyGzcjbRNmzBqdXUiHKMwLIO7XWi3Qdh3fbt+QXNdemi33ycwYISuD5KvWMihWQrqssrSFtZ/s4u2R4y8G2f1Nd/rmO4i/2fMKJbWa3ckvHxHlX7lqN4K31xg7jwtdEv/KUYIO9SeLyNjkchr+f/C9Omgid5lmekoereh5s94X+umbtRl0ZKxz0r+9BIyGxjk/ADUrjki/m2P331OVb/sv251B7OijHWSHwVfjl7gnoPEfzoiFBpTuhNf6MGeIuFi686Z2LA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(261009223027099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bRvNvQuphA6TNXeO+Apa+tGPmuzghF9U6P+jCTWZy3fXumowu8xG/N/f6jqO?=
 =?us-ascii?Q?riC4xfHr7OyO6lwxTf671/bGxUFKcQPJey/fdv452KoV/9BNm38lTjbUUffg?=
 =?us-ascii?Q?Qb2cFLPlX3ZAo9vYM5aUiBrfR7Slm99eCTOpICdQqYYbwGF7EODeQ2hCS9lG?=
 =?us-ascii?Q?0HNr+m/9JUr94PGROwmVTjUYhFE5ROaxE4fwZkzYwJb1fMkIcsUHLVlLlYt4?=
 =?us-ascii?Q?s2kAVsEP8WvQ6b21wX4+ZOP1b/TDF9fASKyEZieKXZ6aO6apOjic7bCYvsM/?=
 =?us-ascii?Q?vawEDkOIOrArbr5Or1SDzWPeaS6N0dzJr+XikpCbaKuFQdP+aAt9xALWEnYn?=
 =?us-ascii?Q?hKY2ibP6Bh5TqFz8lscOdfv/uRg8Snun5nE0GX6lkHxHpqwg5cYmsVfxjiup?=
 =?us-ascii?Q?n4SiHsYEXAHQxiKQ1hvMm6kaaY9XpqWkRXyt7bbPslHXUdvMZbm+UKvIx+HO?=
 =?us-ascii?Q?jdY3DDExK7Qu/sRlkZm1AcymB62gJu1PZlC8xh4/1WDNSHCu0irlCZZ45vaa?=
 =?us-ascii?Q?R9LZV8fAxtp9guRsrEtMU3ztiM8BI0y3rrw4HkwdXmTXwkPvgAH3lCtTD6Tq?=
 =?us-ascii?Q?vG/qBS7VW5eIS1AMOmm4nLnk8k6MnUZiOsMm9q93DesZAeSUiFGyHvYPWwdG?=
 =?us-ascii?Q?LL38vukAkfwmLpjgkzCELSkGdz4ajvKtwZE2RMqCwuBHrJPTvr1KxIvC6nON?=
 =?us-ascii?Q?jtEQ0eaHROEPZmmW+EJn1u/6MiTN8LLO5iGYjaWxFr6jfu7w+IZbgZdI9wO6?=
 =?us-ascii?Q?KJIGZ9HRqFsk9Cu6hGX+ky6iyENo3pr9RZSQ1eHE7/okK5Ysv84VSmvYUwEV?=
 =?us-ascii?Q?Me9r7q1JlHV9hssc16ev7gXlVDC9D3Xptr2fiNw4Dfxljt5s5Yio885lPOjt?=
 =?us-ascii?Q?Ze44L23vXL4bGRCLeOP5dMbL81Y14hUnFBk6BNkTaSF4dUXA2ZwXna50rpIs?=
 =?us-ascii?Q?PpIzAnCdOPmjFSye3q4two9aXY1ifkRjoSgQsAh1/nJelUGFSzIG2mZ3Ep2N?=
 =?us-ascii?Q?us2tmMnG8nDXNZWOyoGlK9suVOIAB7cfOao4J9lkmrUfYzvRpAyPWAIOsv5S?=
 =?us-ascii?Q?RABSswdKX5gUaHoWs03lKsfmpHDQTzrP3LUqfX1kEcH0N9S27jMHPNoVp5aD?=
 =?us-ascii?Q?uBCyN0YODHCPirnriIuCL4gvUd0wk/ymJV4PQeD0WNu5scSbvfkmmFKLPeFd?=
 =?us-ascii?Q?PQHg9QeSzStbtxhsdq1A0uW4YMbhigxJNt2HOCSEAG5jtb+ScXsdxkMAXqcp?=
 =?us-ascii?Q?Emct6IPYqVCsEeJ3UdGHk7sU4LYGyXio+AntjBane9zXyJPSWSSVAMNTxw5J?=
 =?us-ascii?Q?h4ikNjAEVP03ioCmiyyn3um2Bo6FXbzJbdKJwK7IurWov+h1MfrwuznNywrZ?=
 =?us-ascii?Q?oQeSy5LexQRH6UMYJ2KnyM894Masf1aij+OqK4SRD1V+R2Lslsi9WTjqKRB1?=
 =?us-ascii?Q?hohf2nvEsrJeHJ4IGk6wuWwnL1Kl4obxhahjrSVGUId9K1sM5pmX4/T4K98i?=
 =?us-ascii?Q?UuH2eGXxC2p4PrAoJe8W8JAqm76JYB19eyXtEDYoaOzSDHrkbb4W2m2eGDx6?=
 =?us-ascii?Q?F3477pXaagp3u7yIt0FqbuL62h7dMUXyemY2sgm0uk+WownKs2BcdsgkuA9r?=
 =?us-ascii?Q?PfH5nWX1RZuXCrMOSt18MChZkwtHoq9o6ONNyjqYX6/ea5xVy+8mvZ2Lhj45?=
 =?us-ascii?Q?xjIPjJJIzb9KqOY8ImNNA3rtjXidXYW8B+gxUwiAbOh/Xd6if7fCrgpqVcx+?=
 =?us-ascii?Q?sWXphnCdFKbdKL3AsXKqwGHPuuec2R8=3D?=
X-Exchange-RoutingPolicyChecked: aTOD9bXKfbivc2UMtt0uJss3IgqLlKMSXafqTbwOChAkPr3Iw9dr+jSYLmcwWhLZcoZAeCBDVd/4wAUycfEp8+ZyuFgKE+Fjk+Aw+40XoGyunjVnAaZb6AOFHZMgZKIyIq+p3acrzNfCshnTRxF2iMAoLVJOIaG+K2RCAKnG0tyo2qOodprJtJcknEn0tfym9vA4qPCoeDSzb/FRqy9guxkEEllvOukQMk+AsTzsQ6moGGjv6KFvnAihngITj5d100d1mV8rHYXcetNjpCsZemkEUwq40ePZoW82UrLektlyugxSsn3xYdDRY92yOXThWLs0IkSlbPN3ox0F05NCdw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c33feb-16e0-42f7-0a84-08df28c3edcf
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 00:50:09.0606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zURxCPyUNnRNkXHda2djQtvRG7Ht/s65soyfcDDLPwizZmizrP6fj6G0p4Akx4qKzAyNEVWmTUm5DufDm7SafQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6361
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

On Mon, Oct 12, 2026 at 06:33:49PM +0530, Karthik Poosa wrote:
> Read all required thermal groups in get_mc_temp() and store them in a
> dword-aligned buffer, avoiding unaligned pcode accesses and ensuring
> correct memory controller temperature reporting.
> 
> Store the pcode thermal data and thermal limit words as little-endian,
> so their per-byte views match the hardware layout on big-endian hosts.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Fixes: 3a0cb885e111 ("drm/xe/hwmon: Expose memory controller temperature")
> Fixes: c332fba805d6 ("drm/xe/hwmon: Expose temperature limits")

try to keep your sob after the fixes lines

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> 
> v2:
> - Store thermal data and limit words as little-endian to fix the
>   byte-view decoding on big-endian hosts. (Sashiko)
> 
>  drivers/gpu/drm/xe/xe_hwmon.c | 31 +++++++++++++++++++------------
>  1 file changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index c63aa708ab6f..2d1fa9159c58 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -138,13 +138,17 @@ struct xe_hwmon_thermal_info {
>  	union {
>  		/** @limit: temperatures limits */
>  		u8 limit[TEMP_LIMIT_MAX];
> -		/** @data: temperature limits in dwords */
> -		u32 data[DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32))];
> +		/** @data: temperature limits as little-endian dwords */
> +		__le32 data[DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32))];
>  	};
>  	/** @count: no of temperature sensors available for the platform */
>  	u8 count;
> -	/** @value: per-sensor raw mailbox temperature; bit7=sign, bits6:0=magnitude */
> -	u8 value[U8_MAX];
> +	union {
> +		/** @value: per-sensor raw mailbox temperature; bit7=sign, bits6:0=magnitude */
> +		u8 value[U8_MAX + 1];
> +		/** @dword: sensor values as little-endian dwords, u32-aligned for pcode reads */
> +		__le32 dword[DIV_ROUND_UP(U8_MAX + 1, sizeof(u32))];
> +	};
>  	/** @vram_label: vram label names */
>  	char vram_label[MAX_VRAM_CHANNELS][MAX_LABEL_SIZE];
>  };
> @@ -798,16 +802,17 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>  static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> -	u32 config = 0;
> +	u32 config = 0, data0 = 0, data1 = 0;
>  	int ret;
>  
>  	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
> -			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
> +			    &data0, &data1);
>  	if (ret)
>  		return ret;
>  
> -	drm_dbg(&hwmon->xe->drm, "thermal info read val 0x%x val1 0x%x\n",
> -		hwmon->temp.data[0], hwmon->temp.data[1]);
> +	drm_dbg(&hwmon->xe->drm, "thermal info read val 0x%x val1 0x%x\n", data0, data1);
> +	hwmon->temp.data[0] = cpu_to_le32(data0);
> +	hwmon->temp.data[1] = cpu_to_le32(data1);
>  
>  	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_CONFIG, 0),
>  			    &config, NULL);
> @@ -831,16 +836,18 @@ static int mbx_temp_decode(u8 value)
>  static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> -	u32 *dword = (u32 *)hwmon->temp.value;
>  	s32 average = 0;
>  	int ret, i;
>  
> -	for (i = 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
> +	for (i = 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {
> +		u32 data = 0;
> +
>  		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
> -				    (dword + i), NULL);
> +				    &data, NULL);
>  		if (ret)
>  			return ret;
> -		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, dword[i]);
> +		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, data);
> +		hwmon->temp.dword[i] = cpu_to_le32(data);
>  	}
>  
>  	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++)
> -- 
> 2.25.1
> 
