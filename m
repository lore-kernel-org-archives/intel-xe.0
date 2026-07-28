Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92795C54F54
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 19:13:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545C510E3E1;
	Tue, 28 Jul 2026 19:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CRGNKv+L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627AE10E3E1
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 19:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785266019; x=1816802019;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8f9/QPhnYE6vkoNpARzIDI4arHrZpco2amH8GxOfcug=;
 b=CRGNKv+L2E2S7Y3+zcdisZBROlSP+CKfzM97wFsoK8LwekRGkOuns2u9
 Oqb5Vs1QE2MTszSZ66hVOXYoH0/v9g97SY1ReWyJyjtWYwg1rq6BxXC2j
 kTEeKJPVpg7GXNFMxJbcCN/7h69x3IO7wiMkUHypgrWL2zG6y89/yNMqP
 4HjJzlw/JyjJJ4tCvtQTxTgTIOCETVzHPh3HcltrUJjYsSoSISID6LtIq
 VnX2Jf+sLNc2mg/H5dXTvEfHgamm3AwuvjPpifT8Jej03NxAWrEB6X/M9
 DeCrOKOsbEDjLJttgBf3Wi3hi33Piq0BL9ITQNVWITrfBeBIaipBXh1Gs A==;
X-CSE-ConnectionGUID: 6kJvu2/3TWa5o/48Uu5gSg==
X-CSE-MsgGUID: jgiLvxgQScWwRUhWDCWW6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96220388"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; d="scan'208";a="96220388"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 12:13:38 -0700
X-CSE-ConnectionGUID: dNnLsXAsRIufYOgI5dJf6w==
X-CSE-MsgGUID: B1NK/bCSQ/a4pcbZcKUSbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; d="scan'208";a="283125641"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 12:13:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 12:13:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 12:13:36 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 12:13:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdJ/1GAD0Ux+X596bkYEyKMn5uBYIhjRSnhYn47wgcRmpstUwRUM61NTgP+xfABzdkHODEKkmECpavaGiyLHvYiH2SqVtfaYT0U1TdJUcl3Ivl7ekJBpZRaL5R86bd0zRtzcxfpEssNdlgpNln4hIXfI4A5ZLveheJh1MPHqEn0x6Ez5cozJDBAaKpQAnuznjQHKt1ExSRzCmm1p+OQ2qHewTXmwxBegne1fzvE+dG3kAvYAVGGPxexsUCaUND/88/zOCZpv4z0qve9IrC6cZmNxq4mR71NZgygK9IiLlsdGwkIEoS0cQbNmYzj/a36cg4L4+3juRyaV+tXxDREI/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBAzuYT1atXpbppq++0kcph3oeJP3ivUd26YrAkkFHM=;
 b=gxxYbtNvaXZsxVy3wpZW7YjdbBBU3zetLB1ETlCxN/jgBhJlETetsmndfQZBjfk+TuCiP3tZJfPNC02SGHWRocsmC1+vXX2ttm6oxpCoFfsrkh4hUxqcEV1AAiRsVluso4nO0bQt9cohn4HypO/lEWqdblAWlV0ToMDzhW4ZvxIy9Y6rZeOcb0xgGLkTa80Zpt4jixaycYevDvzfv2dneTWd8G6nsdffRMwmgp7PKPiciuGlfaccpHJQC2Z3dSQaDnCQTbe5fsBwBrk4N+Wles4n9hkw2Y73xjnAUZLJ8SUXNlhTqumpMZDc1ZHcAORayoVDyn9czxoPFVWR98evNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by IA4PR11MB8992.namprd11.prod.outlook.com (2603:10b6:208:56e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 19:13:32 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 19:13:32 +0000
Date: Tue, 28 Jul 2026 15:13:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Raag Jadav <raag.jadav@intel.com>, Riana Tauro
 <riana.tauro@intel.com>
Subject: Re: [PATCH v2 03/22] drm/xe/log: Introduce structured
 component/location identifiers
Message-ID: <amj_WEjs62ThicHw@intel.com>
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
 <20260728161039.579-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260728161039.579-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:254::24) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|IA4PR11MB8992:EE_
X-MS-Office365-Filtering-Correlation-Id: ddbc6522-be62-4990-ca98-08deecdc5051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|4143699003|10067099003|11063799006|6133799003|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: pwS200rGHNcEEwaEUEy7ai5kvkaLOoQt5J2WD6v5zI+QpUtLIcPMyqUS0KdoG94zkuXt7MqbtnpJp96KjvusQs8ed6A/QOrBp2dWSqi2qWtaEqBwazFbHbpc+qtCnOV7VoOIluNCIDBllt108epNGcPMiodIU9KShYcZcu+jsRfYt3KZVEzw99YcdiSp7qaYMccINhxjJz8voPNa0wSIKHJl1N1QQUdiOHFGfZagM/SvdxYiqn2M/KthuOX6uNK+bWFpBtEDhw7qzS8ww9ydl52J4h1hV6K99z4lR48a1cieSSPw6LSlfFxQoNjkbCFHBVzT5nx0zxR1XZ7u0C8z6n/LjQOeGx7YBe0ayrYFDYEqNWfWT+lBcfNv6VA1fYx3uc4VnGEWU0sY40RycU+1i402nC9BdJONm6egJ4xPDke94HVhcnI5x6crTraT6WRo2UPWMtziQB+iex9ehkU6k18yUQDmz4dnxbAC0YXwW5ZWwGdrZ0BcrYG7CtqSi+uQKrUno2EUgCGhKUMY7tJWzXNAx7BYx1vKh4bXjx/PS2QCGY7NJBB63tcAq95HZqWA/Rv6FWxMpF075iQPZqQKmofz7KEdBgMiBSpCrpM8wOBjceEktYrr6AK+4ceLbWzzWTiW8lACf7JeGNskUx1RkiUBPojrHveGMao3GW/3/Ww=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(4143699003)(10067099003)(11063799006)(6133799003)(56012099006)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3dheEsxdGJ4R2dBek9ITEkrMVo2cjlyTFRaNnNGMlMxOWo3YWdnamk2Y0VQ?=
 =?utf-8?B?dFpLbW16T2U2czRZR2xKbG9WMzM2a1VwbStMUkhKRmN4THAwZW9hOG10ekJC?=
 =?utf-8?B?MW9yUUcxeGNlWTc5ZTlPemVndGxCK3FkN2R6MjVyL1Z2WEdyYzMzb2U0RFdY?=
 =?utf-8?B?WnZyN1dLNEp0TUNYUHlaamtzRjFEWHg0TFdpMitwSy80QndHd20xOU96MHdz?=
 =?utf-8?B?RXNvWmxaSlJTRzVxcC9KY1pRM0NqNDVMV2FPSEhjaWp6Q2tnSlV3akJTVWNo?=
 =?utf-8?B?aTQvajB4amdNd1VlaWVZN3JFMTRzSlF6S1U4NGdsWEhBa2lhb2s1aDhxVFhz?=
 =?utf-8?B?bEs5SjJLMUJkZGlUVERSYVN0ZWp1YU9mdUwwRmtCMjhnNnQrR3hmS25hbjlM?=
 =?utf-8?B?RVlUdVFHUml3ekR4cnBSbGkyMTByUTBDQmFKcFlLcUx0QzBMMXEwVEdMVWV4?=
 =?utf-8?B?Rkd3QlprUmxOWGYrYjRFbTJGVU1pcUR3emFrT3BIeHByVG93SWRobmNraENI?=
 =?utf-8?B?YURWM0diWkNVQVVqMGR6MGg5WnBpWHp1NnlMazdzcXBwcGkyMWFrb0s0MGRj?=
 =?utf-8?B?bzMzenF3dW5EL2REeHd4alJya3hDZlhhU05MbkZPOTJkbUl5bTAxUTFGMmc2?=
 =?utf-8?B?RXhMNEVXclYzZWJ6N1ZHakd1V29EVGxnMjlyUmlncEJISmtyd3BZRUROWThL?=
 =?utf-8?B?N2gzMTd4R1JZd1pLMnJUTjBDMm1JWFJmRi91VDBiWDEzUTdGY1p2anVjTmND?=
 =?utf-8?B?aGh2TVlKQWdNMVJneGZHR09YejN5bVZ4RzdGS0lRTGdXNTlGY25WdUx2Q3BO?=
 =?utf-8?B?UFREZ201bWVGK05IaXpvQXMxK09LalVNanp3dmlwdnJFZWdBVVhhSGUvY2Np?=
 =?utf-8?B?MXVMV0xWVmJFRWZrS3BNY2dKVWFRS0wwckNGWll0dXVQVUJ4dUI1L1phLzEz?=
 =?utf-8?B?eHpZd0NidTZWYTlUK3ArVE5ybWJjR0dZMERoLzFSN3FNbEdRS2JZcHRHT3ZE?=
 =?utf-8?B?OExMN0t3MlBaUWFlUlpKbVpMbjJ3cFRacURHY2NYbVpmSk5HZU85cGlsQkFT?=
 =?utf-8?B?djYzVnhTRUsxbmg5UUhGb0s2aHhIK0g5aHBlUjR3RXFlaFV2aThCZFZwWlNF?=
 =?utf-8?B?WDJIL2piTnZNMTdaZ0hwSnY0TjdlbENQckwxZVhYVURNTC9mRFdmTUdYaGpK?=
 =?utf-8?B?ZmtreUFXYUwxNWVhdXdUVnpTNnBCZXJRdGVHR3laRjVoWHpWc3Jsb0I3VFpa?=
 =?utf-8?B?MytRN2pNYmdpa291NzJ1clgwYmVRcXJDMjAzdFA0NTJ4aUcrRzF5SWliQW80?=
 =?utf-8?B?TGlqbUh6WHpNamJPSWpyVmhaTXhEWFNBamthV1ZXQ1RheUwrSHF6cHFoRkt2?=
 =?utf-8?B?eHE1dFF0QmtjTEtOZk9TNFFRbHBSeUhCZzliVjFiZVdFNlkrWFhtczR4RHJv?=
 =?utf-8?B?WE9TTWV1NmNxaUpyVEdLZ3NUWUEvb1d6THp0S1NSSzg0eWlpcHMwc3RQTW9l?=
 =?utf-8?B?Ni9rclR1RENwcVBhak9Eb2xMdGtuaHpZT0hhYnhKdEVrREN2N1VrOGRrSlFk?=
 =?utf-8?B?TmtDbnMzRG0wNTBxckVSdXYxNGx1U05SVXcwdWV0RXA3K0ppWnU4QjBPRGxq?=
 =?utf-8?B?b2k3ZS93ZzQ1RUJUWTUrS3pJWXRKcXorYXNna1pkV3NndXVLYk5ZR2xaSmR1?=
 =?utf-8?B?Q1hSZURNME43ZW1DR2FTcGdadFBVNmRwWVNWa29qUVpRamdRcEpaZ2V4RVpM?=
 =?utf-8?B?TFBkb20zQ2d6N3owdStIK3hmNWUwK1RhbGtybG9vM0dsQWN4bXJ0SExSMFQ1?=
 =?utf-8?B?ZDhwQk9yRVdqWjZLQVdIUEprTUFzaXA2QlRCSTZQUXBhOTVnMk1wLzhlbEp5?=
 =?utf-8?B?dGVIbTZYb1JJTExXSGJkdmh5S0tWUmoxSzgyK1kvbGZ5bTk2U29VaGpKQU83?=
 =?utf-8?B?N1ZmbXQ1d1Q4SEZneFFRMmRJQ29kV3k1TGRwRytseGRqT2lZcUhvNUlocTFE?=
 =?utf-8?B?eE54dm1uVmZDT1JVNytIT0ExZEVORTBMWU9EbzBBSUVrU2tpUWgxSUFTSHZY?=
 =?utf-8?B?ZzFUUGIxVEdMSks2R3ZnMkNIY0dFeWdoKzhzS0VjSjNVUi90b0lJdUdSRFQ5?=
 =?utf-8?B?SWRkUVh0bGg4aUhyUzNoQjJXQUoxbnFIcG1ZZnlnNXJqeVFyRDB2RXlRYVVW?=
 =?utf-8?B?cERpeDhtb0FWY1dWbjBvdmZIZEZva1VXRldJdFNJWStXOTUvY0FKOFc2Yzlt?=
 =?utf-8?B?OUhjZ0dReEcvYTQwaXNKM0lSZGhWb3JxRkZCajlHcjhHTjhnMXR4VVFjemRj?=
 =?utf-8?B?OFNwbTN0N0dEbmQxRWFjekxyRC8yQU8xd0NjQzFpZ3VRTm5pbHJWQT09?=
X-Exchange-RoutingPolicyChecked: Ch1LvelFbYJUDjNFbXIVZbY5Lae/HhQ1j8BMmfQNDhNGfv/f70OVdY9rUX6c5lRidXKz0LAFw8VVNPwgIBF4TVE0K18TCeH03pw+HVe00tPcxqUx/6I/Gj8/QwIFSVxKs672wtzuO/jXM4FDZVFakeBWF9j2c0s+qThi7cLJ3BDiTFX8ZC9qFJlDrjaBoyZqk5tS/W/V0vDHTz4kkPunl1mJORXWszu4w+JeGa0M+Ucc9+bjyqQgLf0shKtZQt2tD2kZoH+CkxeDILrUy1lNCdsbTTmeAQLc5C6LZ47hzGJsVp9RMXfv9vg2UdocvhHoO3or4b92XzphD3LurRmqrA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ddbc6522-be62-4990-ca98-08deecdc5051
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 19:13:32.1408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9Hhf8liIUpa0wJWsgApzDGqKQV9A44opQmGBHZKtgnduFjlqZMKNGgN6jcmjyMivfScWJ0UGvYVQlA9jZZ88g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8992
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

On Tue, Jul 28, 2026 at 06:10:18PM +0200, Michal Wajdeczko wrote:
> Introduce structured identifiers for each component type that
> could emit a SIGID log entry and for their locations. We plan
> to store those IDs in the CPER records for better filtering.
> Define also structured identifiers for the supported locations.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: fix typo, define reserved ids (Michal)
> ---
>  drivers/gpu/drm/xe/abi/xe_log_abi.h | 185 ++++++++++++++++++++++++++++
>  1 file changed, 185 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/abi/xe_log_abi.h
> 
> diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
> new file mode 100644
> index 000000000000..fe6e59236f72
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
> @@ -0,0 +1,185 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _ABI_XE_LOG_ABI_H_
> +#define _ABI_XE_LOG_ABI_H_
> +
> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
> +
> +#include "abi/xe_sigid_abi.h"
> +
> +/**
> + * enum xe_log_component_bits - bits for components structure definitions
> + *
> + * Component identifiers are structured based on::
> + *
> + *     COMPONENT = TYPE(8b).ID(8b)
> + *
> + * and the structure looks like this::
> + *
> + *     ├── SYSTEM(0)
> + *     │   └── ...
> + *     ├── DRIVER(1)
> + *     │   └── ...
> + *     ├── FEATURE(2)
> + *     │   └── ...
> + *     ├── FIRMWARE(4)
> + *     │   └── ...
> + *     └── HARDWARE(8)
> + *         └── ...
> + *
> + * Examples::
> + *
> + *     COMPONENT(0.type) = SYSTEM.type = system component
> + *     COMPONENT(1.type) = DRIVER.type = driver core component
> + *     COMPONENT(3.type) = DRIVER_FEATURE.type = driver feature
> + *     COMPONENT(5.type) = DRIVER_FIRMWARE.type = firmware driver component
> + *     COMPONENT(9.type) = DRIVER_HARDWARE.type = hardware driver component
> + *
> + */
> +enum xe_log_component_bits {
> +	/* private: */
> +	XE_LOG_COMPONENT_CLASS_MASK = GENMASK_U16(7, 0),
> +	XE_LOG_COMPONENT_TYPE_MASK = GENMASK_U16(15, 8),
> +	/* private: component classes */
> +	XE_LOG_COMPONENT_CLASS_SYSTEM = 0u,
> +	XE_LOG_COMPONENT_CLASS_DRIVER = 1u,
> +	XE_LOG_COMPONENT_CLASS_FEATURE = 2u,
> +	XE_LOG_COMPONENT_CLASS_FIRMWARE = 4u,
> +	XE_LOG_COMPONENT_CLASS_HARDWARE = 8u,
> +	XE_LOG_COMPONENT_CLASS_DRIVER_FEATURE = XE_LOG_COMPONENT_CLASS_DRIVER |
> +						XE_LOG_COMPONENT_CLASS_FEATURE,
> +	XE_LOG_COMPONENT_CLASS_DRIVER_FIRMWARE = XE_LOG_COMPONENT_CLASS_DRIVER |
> +						 XE_LOG_COMPONENT_CLASS_FIRMWARE,
> +	XE_LOG_COMPONENT_CLASS_DRIVER_HARDWARE = XE_LOG_COMPONENT_CLASS_DRIVER |
> +						 XE_LOG_COMPONENT_CLASS_HARDWARE,
> +	/* private: reserved identifiers */
> +	XE_LOG_COMPONENT_NONE = 0u,
> +};
> +
> +#define MAKE_XE_LOG_COMPONENT(_CLASS, type) \
> +	(FIELD_PREP_CONST(XE_LOG_COMPONENT_CLASS_MASK, \
> +			  XE_LOG_COMPONENT_CLASS_##_CLASS) | \
> +	 FIELD_PREP_CONST(XE_LOG_COMPONENT_TYPE_MASK, (type)))
> +
> +/**
> + * enum xe_log_location_bits - bits for location structure definitions
> + *
> + * Location identifiers are structured based on::
> + *
> + *     LOCATION = TYPE(8b).ID(8b)
> + *
> + * and the structure looks like this::
> + *
> + *     ├── DEVICE(0)
> + *     │   └── MBZ(0)
> + *     ├── TILE(1)
> + *     │   ├── Tile0(0)
> + *     │   ├── ...
> + *     │   └── TileN(n)
> + *     ├── GT(1)
> + *     │   ├── GT0(0)
> + *     │   ├── ...
> + *     │   └── GTn(n)
> + *     └── ...
> + *
> + * Examples::
> + *
> + *     LOCATION(0.0) = DEVICE.0 = "Device"
> + *     LOCATION(1.2) = TILE.2 = "Tile2"
> + *     LOCATION(2.3) = GT.3 = "GT3"
> + *
> + */
> +enum xe_log_location_bits {
> +	/* private: */
> +	XE_LOG_LOCATION_TYPE_MASK = GENMASK_U16(7, 0),
> +	XE_LOG_LOCATION_ID_MASK = GENMASK_U16(15, 8),
> +	/* private: location types */
> +	XE_LOG_LOCATION_TYPE_DEVICE = 1u,
> +	XE_LOG_LOCATION_TYPE_TILE = 2u,
> +	XE_LOG_LOCATION_TYPE_GT = 3u,
> +	/* private: reserved identifiers */
> +	XE_LOG_LOCATION_NONE = 0u,
> +};
> +
> +#define PREP_XE_LOG_LOCATION(type, id) \
> +	(FIELD_PREP(XE_LOG_LOCATION_TYPE_MASK, (type)) | \
> +	 FIELD_PREP(XE_LOG_LOCATION_ID_MASK, (id)))
> +
> +#define MAKE_XE_LOG_LOCATION(_TYPE, id) \
> +	PREP_XE_LOG_LOCATION(XE_LOG_LOCATION_TYPE_##_TYPE, (id))
> +
> +/**
> + * DEFINE_XE_LOG_COMPONENTS() - Define log components.
> + * @define: name of the inner macro to expand.
> + *
> + * Use this super macro to define custom code for the log components.
> + * The following parameters are available for each component::
> + *
> + *     define(CLASS, ID, TAG, SIGID, NAME)
> + *
> + * where:
> + *
> + *     @ID is the unique component identifier within CLASS.SUBCLASS.CATEGORY
> + *     @TAG is unique component tag (across all components)
> + *     @SIGID is the default xe_sigid for the component (without the XE_SIGID_ prefix)
> + */
> +#define DEFINE_XE_LOG_COMPONENTS(define) \
> +	/* */									\
> +	define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")			\
> +	define(SYSTEM, 2, DRM, SW, "DRM")					\
> +	/* */									\
> +	define(DRIVER, 1, XE, SW, "Xe Driver")					\
> +	define(DRIVER, 2, PROBE, PROBE, "Driver Initialization")		\
> +	define(DRIVER, 3, WEDGED, WEDGED, "Device Malfunction")			\
> +	define(DRIVER, 4, RTP, SW, "Register Table Processing")			\
> +	define(DRIVER, 5, WA, SW, "Workarounds")				\
> +	define(DRIVER, 6, PAGEFAULT, MEM_FAULT, "Page Fault")			\
> +	/* */									\
> +	define(DRIVER_HARDWARE, 1, REGS, IO_BUS, "Registers")			\
> +	define(DRIVER_HARDWARE, 2, GGTT, IO_BUS, "Global GTT")			\
> +	define(DRIVER_HARDWARE, 3, GT, GT_TDR, "Graphics Technology")		\
> +	define(DRIVER_HARDWARE, 4, LMTT, IO_BUS, "LMEM Translation Table")	\
> +	define(DRIVER_HARDWARE, 5, MEMIRQ, IO_BUS, "Memory Based IRQ")		\
> +	/* */									\
> +	define(DRIVER_FEATURE, 1, PF, SW, "SR-IOV Physical Function")		\
> +	define(DRIVER_FEATURE, 2, VF, SW, "SR-IOV Virtual Function")		\
> +	define(DRIVER_FEATURE, 3, SURVIVABILITY, SURVIVABILITY, "Survivability") \
> +	define(DRIVER_FEATURE, 4, RAS, SW, "Reliability, Accessibility, Serviceability") \
> +	/* */									\
> +	define(DRIVER_FIRMWARE, 1, GUC, RUNTIME_FW, "GuC")			\
> +	define(DRIVER_FIRMWARE, 2, HUC, RUNTIME_FW, "HuC")			\
> +	define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")			\
> +	define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")			\
> +	define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")	\

As I had stated before, I would prefer a simpler map of component to sig_id
instead of this multi-level. But I believe that this data can be useful
in future.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +	/* eod */
> +
> +/**
> + * enum xe_log_component_tags - TAGs of all supported components
> + */
> +enum xe_log_component_tags {
> +	/* private: */
> +#define MAKE_XE_LOG_COMPONENT_ENUM(_CLASS, _ID, _TAG, _SIG, _NAME) \
> +	XE_LOG_COMPONENT_##_TAG = MAKE_XE_LOG_COMPONENT(_CLASS, (_ID)), \
> +	XE_LOG_COMPONENT_##_CLASS##_##_ID = XE_LOG_COMPONENT_##_TAG, \
> +	/* eod */
> +	DEFINE_XE_LOG_COMPONENTS(MAKE_XE_LOG_COMPONENT_ENUM)
> +#undef MAKE_XE_LOG_COMPONENT_ENUM
> +};
> +
> +/**
> + * enum xe_log_component_sigids - SIGIDs of all supported components
> + */
> +enum xe_log_component_sigids {
> +	/* private: */
> +#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
> +	XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
> +	/* eod */
> +	DEFINE_XE_LOG_COMPONENTS(MAKE_XE_LOG_COMPONENT_SIGID)
> +#undef MAKE_XE_LOG_COMPONENT_SIGID
> +};
> +
> +#endif
> -- 
> 2.47.1
> 
