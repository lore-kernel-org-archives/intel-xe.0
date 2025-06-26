Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F062C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 07:15:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEE710E275;
	Thu, 26 Jun 2025 07:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLzT1f8p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5148C10E27E
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 07:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750922128; x=1782458128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=h3TiIx+P37wkuIAkuy3vUWaRS+SDjofME9P4nex00H8=;
 b=iLzT1f8pSs9jJ2fjda2mXHTyELw/qwfi+JNnLc8lP5ItShcSXAtwZn7v
 8Gc+6WIMwS/2Fzs2jeWNCe2zXHoAEPyoJ0JA0LXj8vHQMGb5n62yDHVut
 8X3pCNKpLfaMh1MJGAYdYTIMKqMYA7cDqF+8YXUfsAAiQjBhiJeAlDIYa
 P8IVOK9ISBzJlv99TNp4l+9bXn+ZiCVF9Ek1p0yvCsw5lgA0r8aQeveho
 6KYrwk1GqtkvDpTxNMBICUjg18uNZF9wsu9/GZP0iXx+XoUqw3z/LbMhJ
 lKEOgN1QqwaFBb8ZtTj4DyWC7FllIwNFuPoBAp3vVlDwg2HqY5H9qF6Vc g==;
X-CSE-ConnectionGUID: H8hAum55Tguj4mlCQK5Q3Q==
X-CSE-MsgGUID: HPWxQFN8S3uHNmgd9TxbNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52322895"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="52322895"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 00:15:19 -0700
X-CSE-ConnectionGUID: G/bBywTkSHO9fssq7tOKLA==
X-CSE-MsgGUID: Z+EgGd/zQXqqQUilmEMvzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="152609895"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 00:15:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 00:15:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 00:15:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 00:15:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+1MvBkPw14Q3gbz7Fgggkrkofvvr2T6IcUtLyqnDsW8btRfw6YiOn95DUk0bRTD6kIvhsGIVG9SPRMG21i65+NxxbwDdRiTPv2nAGLULqW/EE0WQ+6uZnUG1lHOhURk8uRJozMZyCTB4Gdwuha73FkdbvKdXUGdlMa+yOv+VHU4Tlq1rN65uU+8RGf76dCwq2IzVGySLlsymJNK2s6fja3cb4LqyFnQmZ+FkJk9IRYunm4eYeTg3vIAcSogkZj6mszYf6XnIQdUOQRiO6JcnuiKra0/rvQcWCsOdv1bEYK45lfcPFNhUXw1lglp9uQ3l68eP+leRHMT2xS2/Y3x1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6zU2OHJLTwK019VC/02o+cUQtxLrrDfFsf9ME/Kbx8=;
 b=luBdBaajI2N3JHUmDEBlxbOwktTi5ufaoGu69q+sqGh2TbNLBrPDmDSOv9c5p+3iiRZmstvP/pfueTBsXZvLmUg4EvpazL5K21fKMlhXSotrj9eF90EO7kBLU6fVWuFl8jggaUiFPL7i6rmxWZHykcaVBBsDMRBevQcG000qQp03dNZwpZ6/GPgWI1+11WTF4Kbs5ny4r/JomLY5bccloIyTqv2VRvHW7eVKWN2DC64bkb7cL27M58nkR2orf3nf4qCxzBQsX0XqodhiXix8GzynQ3WbMWYo8PRK5Ch3B0SG60dh2mtK5OZja3IPemqnXbXiSarzJJG7vhvM76GlIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB8827.namprd11.prod.outlook.com (2603:10b6:8:254::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Thu, 26 Jun
 2025 07:14:52 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Thu, 26 Jun 2025
 07:14:51 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Jani
 Nikula" <jani.nikula@intel.com>
Subject: [PATCH v6 3/4] drm/xe: Move struct xe_vram_region to a dedicated
 header
Date: Thu, 26 Jun 2025 09:14:36 +0200
Message-ID: <20250626071437.3223888-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626071437.3223888-1-piotr.piorkowski@intel.com>
References: <20250626071437.3223888-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0291.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::9) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB8827:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aac5fe2-646b-4bed-99f5-08ddb48124c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cldHKzkwMERRdzlPaVJVeElISlFOVnZhVG9COWIzQU5mVmZ1S1ZERGFxcERn?=
 =?utf-8?B?anRJM2tZQ1JXOSswcEUwSDBMK0tLbVRMbXUyb2psSXR0Z0ZOT1dZU3RwWTRB?=
 =?utf-8?B?aCs4TVpjSDNlTEdHT2NKaEc2T3N2TnhjN2x4NE1xWHJsR1A1d2JRRllkY2w2?=
 =?utf-8?B?aG5GOEsvUWhBcGc4Mi9Vd1FNWFkxbjFUWGFIeXNmQUZIU3JoZ1pvMmhCYjFU?=
 =?utf-8?B?NURIZEZkOFYzQUhsVGpNS0JJZHFOMzdYS3Z5SXlWVHA1R0VpVzBubm5IaUtl?=
 =?utf-8?B?ZHh3QXFjT0ZqZmtzMER5SnRlbU5EY0lkREZ1bTNLSUQ5VFd1KzV5blVXUzU0?=
 =?utf-8?B?c3JoS0NZZCttaHVDdmY0d0dNTlJyU3FZaXVJKzJkVndnVXorblJtck1DcDVK?=
 =?utf-8?B?QjFERVFZNk5GS0xVcTk2TEJWQ1dqWVFJZ3d5UHp6aGlrLytIMHlHelMxcGZX?=
 =?utf-8?B?aVBLdkdMSFQ4d2Z2SlozTHB2M21teTl0Tld1L29EaVZBSjlpdUFJM0pWOCta?=
 =?utf-8?B?aGJjdW0rY0M3L2dUL3dhemxXWEprd1RiMGpmVUJYKzdCZWlzRHVoQktjTkw5?=
 =?utf-8?B?Ujg2TnltWHQyM0xYNS9iRC9oOEpzemJ2SDBtdjJ0VVhvWUpzaTM1VGx1dWRn?=
 =?utf-8?B?WFNTZHkrYzJzMFFxYXltNVVHY2FOVklhbkFFaE9qVld2R0NMTG1HYUZMekht?=
 =?utf-8?B?LzcxaXMyQ1NBcTFyME44TlVYSVhhcUs1V0ZEVEdnSFpkQmcwU3VaTmhrRDR1?=
 =?utf-8?B?eHpFV1dFY1dhV0dPeTVhRkRFV2wyZmw3RktxcnVoOXNGS3A3Y29uZ2lINFNH?=
 =?utf-8?B?ZmVBL0tOdWRZQkVUOHdtOUppTkZQWXk1QzdsQXhMK081Q2RMU2F5MGpubnVF?=
 =?utf-8?B?QmdsYWtDaW5Wd3htUWNTL1IwNTQvVDZWbENNbVZBNjFWc0xaaDQwbGpySEVO?=
 =?utf-8?B?aURHTWlLRGJvQlpxRWlUZXRpVmpsKzFiN0ptdW9DN0d1MHdSeWFGTm9lU2Ji?=
 =?utf-8?B?T0x2cDl1RSswb3FTeVZzblpwbUNKeWt5cHFvMTFxM21Yb2FyaWcyUmZsYUJj?=
 =?utf-8?B?eGg3WTFzNGpJbzVON1ErTVZmZ0tQL2JYYmwxZThkSnlzcnlTU2VQNDQrK2Z3?=
 =?utf-8?B?MDd0Z1hmNnp3WHZMTDFGeDVtVXhFL2dqTlRuMVBaNGdtS0p3SDNQOVI1ZkFD?=
 =?utf-8?B?UXp2K0k1NlA3OTFZVzZVT3V6L1JodjEzenVKREZXUytaZzZhTlA3a3A0dG02?=
 =?utf-8?B?dmg4ZEplWElTQ1dsNjlyRlVZRlZIMTVkaWsrV1dvV2pUVkEva1ZjRmw3QzAv?=
 =?utf-8?B?a2MxYTJheEp4bnlzMGF6dzNjcHJxWEZsSFpQUER4MHFmenVXaXhnOHVpVmJP?=
 =?utf-8?B?bGVqUTV0bllDV0lOMzFHVXo4dHBoV2lyK0Jvblp2a3BldEFFZ0NhQmRiN3dB?=
 =?utf-8?B?MVErc05WWU5QWlFzUVlKUGdHK21wbmlLeWM4OTdKeVZ4OXUxSklLOFhiUGdJ?=
 =?utf-8?B?Rkd1RWRBT0FYbk5GTUlHa2VpZlVVeWhRRWRwd0dXK3pZVDlrNHBQMnQ4SHBH?=
 =?utf-8?B?Um1OUTZnUTJUeG1ud2sxeElURGFLSDFUcGdsK1ptWFFjNGZzWXBSdTRQdUZZ?=
 =?utf-8?B?d3k5aVlhWUFLVGJLQ2FhbTFzNmZ6c3B5TTdEeDh0QmpZMXBzbFJhQytvL3Za?=
 =?utf-8?B?WHlsUXlnZWVlN0V4bHR6QTlYV0Q0SkR4Q2FnUTJqbWpyOWZhVkdCdWFDUVpW?=
 =?utf-8?B?ZEVxUlRlTXpIS0JiVUZTQjZ4NFVjMjlpSDNWdHorVkwza05JV1o2UkFKcjhQ?=
 =?utf-8?B?ZmdLbVdDdHlJV1JSZnFOTEkxWE9sWkowbTQwcjZxT1UrbXgrVXRiNjlxV0Qr?=
 =?utf-8?B?Tm9NTGk2bktsdXR3NHNKbmEwa1RWbkl3YXFnL0NoQ0Q3U3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wmt5eDFXS3FGTm5MQ0drY1duQXA2Z3JOMm5uVlU4dDRJWkxGeWdMbHoySGQ0?=
 =?utf-8?B?MjlvMXpkQ0dHVjc5RW0wN2VFeWNxMldxaGRRNlpTb0dHREJmemFhTW84OERk?=
 =?utf-8?B?c0hHSDJJcDhrTXZkK25FZ3BRMWFTN1FUOE1HUXgxMXkzTTNrQ3h3emZuWEhS?=
 =?utf-8?B?cS9hMk05TS9zOGVVQXQ1dUdMNThrUk9JZ05ZRzhwcXNuVmY0RmVqU0s1MXl2?=
 =?utf-8?B?YXJ0MFh1b1ZOc01wTlRhcHpUZEFYd3VHOWp3UTlESXRsMHZWTjh3NUlqOFJq?=
 =?utf-8?B?QTRzLzErZEZkRWk0N05VWS9iemlTNklCNkVod21OV0s2YnFtZXMwVkdZbG1G?=
 =?utf-8?B?TU5sVTFzRFVXd2Y0d1UxMGdGbVdzYWRRYWVicVpndjBzSEhwUDQvZFVQSXVZ?=
 =?utf-8?B?ZzZ5dnc3QXozRmRlL3NtczJnWGJUTVc1QSs2Qm5BK21QazNBU202U294dFBw?=
 =?utf-8?B?Ty9qZ0lvZG5Vbjg5OXFucW81UWFleHVOdnJaTHlSUnM3OUpDZk1seHY1S0pO?=
 =?utf-8?B?Zkh6RFdlU1dGKzlqWWRLM3d2RkZkek0xT2ZkeW1xZjZZVEs1ekdlV3h2UVBt?=
 =?utf-8?B?MG9DMnl4T2VTZloxcW52dzRHT1RUL2VjZWhOTGZoeWxmNURjMzVlM0xoZ0Nk?=
 =?utf-8?B?R0dJc3M1VWNUZ01ZbVVEWUEzOGJ1WEFCaHE1SFBISXRPendNelBSRi9yODM3?=
 =?utf-8?B?a2dVaU1qTGdvUE9KM2dMMmpWRVUzZlR4eUkvQmpIR2ZrcytyVWhuYmVWZDQ5?=
 =?utf-8?B?M29IeWpacGh4a05QOWNIUjRZSnRsODNYckp6N2grSk5ySGl5SHhmV3BUM2R1?=
 =?utf-8?B?TnlQWkNYQVNjUnA5OUVwM2o5cnAvd29yMG85TGdrb1JWVWV6NlB4VlE0aG5o?=
 =?utf-8?B?eGVwL01NNFMreFoyQU1iODF5aGZISXhCTXdIRkcyWTJmU2lJUjd5dzVnT2pG?=
 =?utf-8?B?N0NHWGxZUkNlVGNPVE9GdzZTalN1WkI5T241NGtETVVHU1BhajBRTzNOYmVL?=
 =?utf-8?B?aFpGSlgweEs3dUlMUXdKU0dHQzNvbktldGVpYU9qbUltUkk3Y3dpNXdhRGFn?=
 =?utf-8?B?b0RhVTYxMStTeEdjY1EzRjlnNjl6M1lPcTc3TkRZRkJkNVRHV3pmTTRkRE1r?=
 =?utf-8?B?bW5CNjVqRG5CQStDM1pRVkZDY280NDhwNStkc21XMU5ZZThzb2x4N1laSUxa?=
 =?utf-8?B?WmJ2UDgzRWhzRlY4QW1teU4vVHJ2dHhCWldJZ1FJTkkxSGJ3R3h1S1ZVRDRO?=
 =?utf-8?B?NCsveUtCbEJNYTZoSS8rZm15TFRSREVBU2E4SFRkbUNBY1hDdWF6a05WRkk3?=
 =?utf-8?B?M1NFZHVrVHpMRUd5bWxwWDQvMDNNUUd5dHkwNmFkdWUrSmU3Wm9xeTcxNkhz?=
 =?utf-8?B?K0h6a3NJRFBWNnN3VCtNK3EySGxmTzI0WUJKN1RsdW1xMERMZDZlRmh3ZGZp?=
 =?utf-8?B?bWd6alBTeHVNYmxjNVB4dlpLUDJtSzIrOTZhTzYyckN5RWUxZk5tUjVmVG13?=
 =?utf-8?B?OTNGYlpndWZya0ZkbXF6TlhNSytibEltMXJRQlJFOVI5d2xSaGs3SlBOT3Ra?=
 =?utf-8?B?d1N6OXd5WFFzN3ZhK0tpaWkxUkZGOWVtd2htRk96UmtQTjFQdmtPSFhqcXU5?=
 =?utf-8?B?aitzZk5kWEYwZUFMWXlaeGJDS2V3elNveVBkbVR0Mk9XWXRHQS9tSmtUWmI2?=
 =?utf-8?B?Ti8xTVVkNmREVm5yaTQ3NUxLSVZuczJKM3RRRk13ZWkxNzFmRTlkcHhQZWhQ?=
 =?utf-8?B?cll6RXVQSUZicWlCUlpXUVIweGRmUkZyUDBQZk91alcyMExScEZibXF1Ri9N?=
 =?utf-8?B?TlVCQ2VSQzFPbWRhMUZBUWFZYllnVG1QZEkwMmdXRFlvWFJqMmg3R0VuVzhm?=
 =?utf-8?B?YkR4bmF3VjR2dXBRK1pMckxCTC9uTHUyV1hrbmpFWVhGSVZSWTZQMG1ydzZY?=
 =?utf-8?B?Z1I5SS9IVExiQTZrUVhqb1ZyWWJOS1I1dWU1am55T20wNHg5SHF0TDRCL3Zp?=
 =?utf-8?B?SzJvZzUyVTBtRFhHb1VRSEJJT1l0T2xnQWtabGpmVDB3YWVQWVAyS2J2UGFi?=
 =?utf-8?B?dDlrSWM5UDh6czEwN01hNnFvWTRZblNCRlIrZ25DQytubjFCSmN5ZTNuUUcr?=
 =?utf-8?B?UW1Uc2gvZk8vbCs0ajcvSnhIaGxSc0JJZlg2ZFlrb1hGSXhDazVNQ2FTS1Jl?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aac5fe2-646b-4bed-99f5-08ddb48124c4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 07:14:51.8998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B8N1V0mWmusfVLnlwCkfM7Ixsi4726kPre/PASMNqciP6RgiMstaCnu3w9NLbgGUCxbfGfddxRjbka95p+1zxdEd7qzPga6aIldXzSzOPm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8827
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Let's move the xe_vram_region structure to a new header dedicated to VRAM
to improve modularity and avoid unnecessary dependencies when only
VRAM-related structures are needed.

v2: Fix build if CONFIG_DRM_XE_DEVMEM_MIRROR is enabled
v3: Fix build if CONFIG_DRM_XE_DISPLAY is enabled

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Suggested-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  1 +
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  1 +
 drivers/gpu/drm/xe/xe_assert.h                |  6 +-
 drivers/gpu/drm/xe/xe_bo.c                    |  1 +
 drivers/gpu/drm/xe/xe_device.c                |  1 +
 drivers/gpu/drm/xe/xe_device_types.h          | 60 +--------------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  1 +
 drivers/gpu/drm/xe/xe_migrate.c               |  1 +
 drivers/gpu/drm/xe/xe_svm.c                   |  1 +
 drivers/gpu/drm/xe/xe_tile.c                  |  1 +
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |  1 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  1 +
 drivers/gpu/drm/xe/xe_vram.c                  | 12 +++
 drivers/gpu/drm/xe/xe_vram.h                  |  4 +
 drivers/gpu/drm/xe/xe_vram_types.h            | 74 +++++++++++++++++++
 15 files changed, 104 insertions(+), 62 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index dc8547640d44..7d3633881c53 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -16,6 +16,7 @@
 #include "xe_device.h"
 #include "xe_ggtt.h"
 #include "xe_pm.h"
+#include "xe_vram_types.h"
 
 static void
 write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 97b58c0ff39a..056d771b24f6 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -22,6 +22,7 @@
 #include "intel_plane_initial.h"
 #include "xe_bo.h"
 #include "xe_wa.h"
+#include "xe_vram_types.h"
 
 #include <generated/xe_wa_oob.h>
 
diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
index da357dd42546..a818eaa05b7d 100644
--- a/drivers/gpu/drm/xe/xe_assert.h
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -12,6 +12,7 @@
 
 #include "xe_gt_types.h"
 #include "xe_step.h"
+#include "xe_vram.h"
 
 /**
  * DOC: Xe Asserts
@@ -145,9 +146,8 @@
 	const struct xe_tile *__tile = (tile);							\
 	char __buf[10] __maybe_unused;								\
 	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
-		      __tile->id, ({ string_get_size(__tile->mem.vram ?				\
-						     __tile->mem.vram->actual_physical_size :	\
-						     0, 1,					\
+		      __tile->id, ({ string_get_size(						\
+				     xe_vram_region_actual_physical_size(__tile->mem.vram), 1,	\
 				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
 })
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4e39188a021a..196acffe0180 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -34,6 +34,7 @@
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
+#include "xe_vram_types.h"
 
 const char *const xe_mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
 	[XE_PL_SYSTEM] = "system",
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 86f8ca6a96e9..126faf560909 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -64,6 +64,7 @@
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
 #include "xe_vram.h"
+#include "xe_vram_types.h"
 #include "xe_vsec.h"
 #include "xe_wait_user_fence.h"
 #include "xe_wa.h"
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a7bcda67d05f..619728bba77a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -10,7 +10,6 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
-#include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_device.h>
 
 #include "xe_devcoredump_types.h"
@@ -24,7 +23,6 @@
 #include "xe_sriov_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
-#include "xe_ttm_vram_mgr_types.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define TEST_VM_OPS_ERROR
@@ -36,6 +34,7 @@ struct intel_dg_nvm_dev;
 struct xe_ggtt;
 struct xe_pat_ops;
 struct xe_pxp;
+struct xe_vram;
 
 #define XE_BO_INVALID_OFFSET	LONG_MAX
 
@@ -68,63 +67,6 @@ struct xe_pxp;
 		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
 		 struct xe_tile * : (tile__)->xe)
 
-/**
- * struct xe_vram_region - memory region structure
- * This is used to describe a memory region in xe
- * device, such as HBM memory or CXL extension memory.
- */
-struct xe_vram_region {
-	/** @tile: Backpointer to tile */
-	struct xe_tile *tile;
-	/** @io_start: IO start address of this VRAM instance */
-	resource_size_t io_start;
-	/**
-	 * @io_size: IO size of this VRAM instance
-	 *
-	 * This represents how much of this VRAM we can access
-	 * via the CPU through the VRAM BAR. This can be smaller
-	 * than @usable_size, in which case only part of VRAM is CPU
-	 * accessible (typically the first 256M). This
-	 * configuration is known as small-bar.
-	 */
-	resource_size_t io_size;
-	/** @dpa_base: This memory regions's DPA (device physical address) base */
-	resource_size_t dpa_base;
-	/**
-	 * @usable_size: usable size of VRAM
-	 *
-	 * Usable size of VRAM excluding reserved portions
-	 * (e.g stolen mem)
-	 */
-	resource_size_t usable_size;
-	/**
-	 * @actual_physical_size: Actual VRAM size
-	 *
-	 * Actual VRAM size including reserved portions
-	 * (e.g stolen mem)
-	 */
-	resource_size_t actual_physical_size;
-	/** @mapping: pointer to VRAM mappable space */
-	void __iomem *mapping;
-	/** @ttm: VRAM TTM manager */
-	struct xe_ttm_vram_mgr ttm;
-#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
-	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
-	struct dev_pagemap pagemap;
-	/**
-	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
-	 * pages of this tile.
-	 */
-	struct drm_pagemap dpagemap;
-	/**
-	 * @hpa_base: base host physical address
-	 *
-	 * This is generated when remap device memory as ZONE_DEVICE
-	 */
-	resource_size_t hpa_base;
-#endif
-};
-
 /**
  * struct xe_mmio - register mmio structure
  *
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index a33a6f3a6731..140d55ebd476 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -33,6 +33,7 @@
 #include "xe_migrate.h"
 #include "xe_sriov.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 #include "xe_wopcm.h"
 
 #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index c0bd23aaaa23..0989c45d3e9f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -34,6 +34,7 @@
 #include "xe_sync.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
+#include "xe_vram_types.h"
 
 /**
  * struct xe_migrate - migrate context.
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 98d79c118e45..bc557fa07926 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -13,6 +13,7 @@
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
 #include "xe_vm_types.h"
+#include "xe_vram_types.h"
 
 static bool xe_svm_range_in_vram(struct xe_svm_range *range)
 {
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index c64a4d1a5bb9..6f50c15d0cfc 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -17,6 +17,7 @@
 #include "xe_tile.h"
 #include "xe_tile_sysfs.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 #include "xe_wa.h"
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 19bfc22b9706..dc94d133310d 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -24,6 +24,7 @@
 #include "xe_sriov.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 #include "xe_wa.h"
 
 struct xe_ttm_stolen_mgr {
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index d9afe0e22071..585bc1232658 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -15,6 +15,7 @@
 #include "xe_gt.h"
 #include "xe_res_cursor.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 
 static inline struct drm_buddy_block *
 xe_ttm_vram_mgr_first_block(struct list_head *list)
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 7e3980bcb4e6..cf92a9aa2435 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -20,6 +20,7 @@
 #include "xe_module.h"
 #include "xe_sriov.h"
 #include "xe_vram.h"
+#include "xe_vram_types.h"
 
 #define BAR_SIZE_SHIFT 20
 
@@ -375,3 +376,14 @@ int xe_vram_probe(struct xe_device *xe)
 
 	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
 }
+
+/**
+ * xe_vram_region_actual_physical_size() - Get the actual physical size of a VRAM region
+ * @vram: the xe_vram_region struct
+ *
+ * Return: the actual physical size of the VRAM region, or 0 if @vram is NULL
+ */
+resource_size_t xe_vram_region_actual_physical_size(struct xe_vram_region *vram)
+{
+	return vram ? vram->actual_physical_size : 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index e31cc04ec0db..9092ae86df22 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -6,8 +6,12 @@
 #ifndef _XE_VRAM_H_
 #define _XE_VRAM_H_
 
+#include <linux/types.h>
+
 struct xe_device;
+struct xe_vram_region;
 
 int xe_vram_probe(struct xe_device *xe);
+resource_size_t xe_vram_region_actual_physical_size(struct xe_vram_region *vram);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
new file mode 100644
index 000000000000..dee104beb2fd
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_VRAM_TYPES_H_
+#define _XE_VRAM_TYPES_H_
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
+#include <drm/drm_pagemap.h>
+#endif
+
+#include "xe_ttm_vram_mgr_types.h"
+
+struct xe_tile;
+
+/**
+ * struct xe_vram_region - memory region structure
+ * This is used to describe a memory region in xe
+ * device, such as HBM memory or CXL extension memory.
+ */
+struct xe_vram_region {
+	/** @tile: Backpointer to tile */
+	struct xe_tile *tile;
+	/** @io_start: IO start address of this VRAM instance */
+	resource_size_t io_start;
+	/**
+	 * @io_size: IO size of this VRAM instance
+	 *
+	 * This represents how much of this VRAM we can access
+	 * via the CPU through the VRAM BAR. This can be smaller
+	 * than @usable_size, in which case only part of VRAM is CPU
+	 * accessible (typically the first 256M). This
+	 * configuration is known as small-bar.
+	 */
+	resource_size_t io_size;
+	/** @dpa_base: This memory regions's DPA (device physical address) base */
+	resource_size_t dpa_base;
+	/**
+	 * @usable_size: usable size of VRAM
+	 *
+	 * Usable size of VRAM excluding reserved portions
+	 * (e.g stolen mem)
+	 */
+	resource_size_t usable_size;
+	/**
+	 * @actual_physical_size: Actual VRAM size
+	 *
+	 * Actual VRAM size including reserved portions
+	 * (e.g stolen mem)
+	 */
+	resource_size_t actual_physical_size;
+	/** @mapping: pointer to VRAM mappable space */
+	void __iomem *mapping;
+	/** @ttm: VRAM TTM manager */
+	struct xe_ttm_vram_mgr ttm;
+#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
+	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
+	struct dev_pagemap pagemap;
+	/**
+	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
+	 * pages of this tile.
+	 */
+	struct drm_pagemap dpagemap;
+	/**
+	 * @hpa_base: base host physical address
+	 *
+	 * This is generated when remap device memory as ZONE_DEVICE
+	 */
+	resource_size_t hpa_base;
+#endif
+};
+
+#endif
-- 
2.34.1

