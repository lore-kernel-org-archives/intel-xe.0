Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EA4E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 00:37:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C931F10E20A;
	Wed, 18 Feb 2026 00:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fnZTl1Q5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E7210E20A
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 00:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771375061; x=1802911061;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NKeTKDU5kUaNKBGW7MW1GqE+su6pELBo0x0z+xSvEvs=;
 b=fnZTl1Q5Rexw6lFiOCX/erLdF2D8cML5Epi4T+c6A+NoxtSrO/vRU4k2
 KTaRtuKOhWy8dIz9AlkF0rakUBcs+io935PsNWIVO/Azb/6B/zmR9+PLj
 tYXYEuS3XAx2es8WjuphNHQDukMOJl9DQCzkrsKtkwuKxQA4tmTORVV5J
 7/KOciAU9hXoQrMGWiLOZJTktV7p6ZV7F3aUOvivydm3JuZTKCKKHl9XK
 +Qd9ma8rTT6Wqy9emmsNFMOWqz8bKwufttY9vXZb85IdksfPbBCRFX9CG
 ScAxnKaGGNyUPHq8ShLB6HIzdKkDffZgb7LXOOOMuF2UNkg/nsaNSkHrv w==;
X-CSE-ConnectionGUID: SGjBcXcGQLuJC489IbkqmQ==
X-CSE-MsgGUID: ATXeQMtyR82oPLh3ulqHlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72355021"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="72355021"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 16:37:40 -0800
X-CSE-ConnectionGUID: Q6Cscmp2TPqYzIsmW5tBOg==
X-CSE-MsgGUID: /rFlxTvYTOuySmbNSp5U0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="237053122"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 16:37:40 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 16:37:40 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 16:37:40 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 16:37:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgtS5MkyMKoRgBGMRMVvTEWxXNXyAqYQwS3vVt8NI5LAZXZx4U9a/wuVXOL338WVbE+3jp2PcsQXGi99YPFlczdAT9LipJEBNU7ICLvrxOfS+YpTgMS3IPaO/GZ2jqBqx0GHEREXMmLk97MOWjMFyRuI8QMUzzxOSOFPyRYKa1YNLRqyqqf8vOhYQO/9nN0Sz58C7UbRhwG1/Fh6mewV4b6KtgZd3gnKwzSMO6KbAUZGcPs05QcEr/Kfz+n2c6NaOf41ppWJtjp/kdHBJj8idZiKveqLfa/LqpXlbSVgfnOR/9qwgfyl0HGnxaRjypX4gFGDDiL4W/9mFyYZl0h4bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtHhNjiM5d+hxRzav6Qz3fjQUQulWA+IMsp9KFKhrug=;
 b=sqLMnuR5jAOxbDwmgzxuNKzKcm9D85e7/hoy+JsBcZPB2D+wuvqJRcQvS8mWdZPUlDzTG9Eym9iA3N1d3/lhrmn90lWQWVxczPf+FkXHvXdu+PZLgacXgZJ+xSqos5O8rdV0NyBssnhQW/+5ZhuEZfl9K78t/wDTWN3J+pmAKRF7MVqvxoZy7CXIRoJKGLk1Y2gmZVLlW3FbC/hFTAeE3wWwUJQje9AKAnKQsLNi8hsVBNGQ+1AOW6yosHGPt/IzN0XSQbdtYEImYjrXZdKURhdCwwYF40fpHEBeqiaa0zqoMRUdPLQLciuUkmv4s7tJBjvPiC85ejOgpzkQQJBNJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH0PR11MB5877.namprd11.prod.outlook.com (2603:10b6:510:141::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.12; Wed, 18 Feb
 2026 00:37:36 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:37:36 +0000
Date: Tue, 17 Feb 2026 19:37:31 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Raag Jadav <raag.jadav@intel.com>, "Aravind
 Iddamsetty" <aravind.iddamsetty@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH 6/6] [DO NOT REVIEW]]drm/xe/cri: Add sysfs interface
 for bad gpu vram pages
Message-ID: <aZUJy5baVacPxGM9@intel.com>
References: <20260213092552.1527799-8-tejas.upadhyay@intel.com>
 <20260213092552.1527799-14-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260213092552.1527799-14-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY5PR16CA0003.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::16) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH0PR11MB5877:EE_
X-MS-Office365-Filtering-Correlation-Id: 12852812-281e-40e2-2f9d-08de6e85e98d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b25QeEQzVmJCcGlrOHZXa1g4cEljaTc5UFFRdXltUUt2L1FCdCtlZnVGdGRK?=
 =?utf-8?B?cXhVTEs0amZELzV5ZnV0aDhmRUFwVVFPVWRsNGUwM1hsNmg5cGVMaHc0U3hs?=
 =?utf-8?B?TWJGQ2lvdTNReXYzTzRITThMUDZDNGdMVURqbjM1VitCclVQQ2t6dVBDajRT?=
 =?utf-8?B?R3A2eENHYzh1eXJaVXU2b1VhZ0dRalZuN2pjbGl5S2lYUjI4MkdweXAvbXZ4?=
 =?utf-8?B?d3BqM2lNWHBHbmloYy9sRDFMMmgxeWFCVy9jZUo5VzFSRmpneDZkTVNLSXhX?=
 =?utf-8?B?dEx3ak56RHhHcFd4cm1JbnJ6dFNVRnlsM2F5U3NZNDNCQkgxbHNmYThsSGdG?=
 =?utf-8?B?REtXa01HOHNKQTQzMXAyWlQraVhyRlI3RUd1S2RZOHUwNWZGSnFqd0J4UjBo?=
 =?utf-8?B?aU1INlpQcFNaRGNHdFM4elk2NENoMENmMHkxa0dxTEZZV0NRaDQ4eWY5NEpo?=
 =?utf-8?B?NXp1UmFHRFgrSkRJVDIvRVF0Tjl2M3BlWmJucU51OGoyT3JYNXJUUTBWUFlC?=
 =?utf-8?B?UU8zeUROYlRxV0hVVnhTU0RWcmo3TWxiRUFxdHE2TlZPek1Odkg5YzhXUGVx?=
 =?utf-8?B?SG5icSttOEk5M2NISG1tMUVLV3Z1ekQ1ejN5SHF5c3BhdW1Xay8vUHk0OTJB?=
 =?utf-8?B?elJQQlp5VzFIRVYyYjlnTXc2Q0kyOU14OTRiT3lYc2VNNWZ5bnp4NFFTYjRI?=
 =?utf-8?B?MldLR3Y2M0hVVmJBbks0cmtFeFJUbzYyWE03SmNEdmwvQUFhRnd4cVlubDNh?=
 =?utf-8?B?VDNXdEtZMnBVbFhGYVA1UEpJRWEyeE9TVEsxRkVHSWlUVGh4bGVkUk42UDlr?=
 =?utf-8?B?UjlPZDBLWEhudkp6S2xqMDZVZG9mMjZIUG0zclVkbVErWXNEeXRweFJKZ29X?=
 =?utf-8?B?K1dUUk8vMGlWdzRrZFQ0VjlneGRoZjlFR2NlcVVqZFNMdS90dlczTld1REor?=
 =?utf-8?B?SGswQ3I2OTl6K3RUb3oxeFJrL1Fxd3ZnLzU0bjdhSjh0WTljNEt3ZVJSK3N6?=
 =?utf-8?B?dTk2UXBNRndsTGJPRXJ3Zm5pdjQvSVB5N2xsVU5wMFhKSFJBenZXNWhzcEx3?=
 =?utf-8?B?QXNVVDdKWi85VmxQY1lud1Q1a2E2NzBza1dTdHk0T0doMGpoalZoU1lLMDhH?=
 =?utf-8?B?dkdiaDdLZ0tsMmE1VVJDY1ZPOWFSL2hxYjFIdDExSG5WdDVHRFJMWnlYN1Bj?=
 =?utf-8?B?My9qVFh4R2JNd0JFV3oxZHpxQ2NkbnF0L2lMNDh5K2NwdzA4ZzArWnVpM2Rh?=
 =?utf-8?B?Ly90Q0pFS2RtVk1DZlhFWk44SG9MUXZQenJwUnVIc3MwVFhXTkVHS2l0L2RK?=
 =?utf-8?B?S3luT0hyTThoWHR3ZFlyNHZJdnpRWHhaRWFIM05uSGtjMDVFcGVxRzNsOC85?=
 =?utf-8?B?bjgrQmlwNG90NnFOWkhSeVZNT0UrYXhKcm0zb3RYdjZmRHhhN3ZadGtJNkg0?=
 =?utf-8?B?RlZjbUl5VDBvd0owbHQ0Lzc4ZDJuRjQ0N3hvQzBUZmRNTndTY3k5bk5zQzd3?=
 =?utf-8?B?cFo5REZ5c2R5dG1Zd005aEVYVjYwdnZQemdpaXJTZEtaWmJEYksyeE56REpO?=
 =?utf-8?B?a0tCM1gwNEZlRjg1ZW1oOGJrbkNRY2lyMGJETUNNVklpd1hJeDc2MDhUT1FJ?=
 =?utf-8?B?UjNSRDRnRVlMbWlRUjR3TFNMOFhMVlVJSnJUZDVESThsNkEzcGY1R0pkZllL?=
 =?utf-8?B?QWo5RnhTTVlMMkY0NEhsZ3VWRTk3UG9wbzUyekZnZFpQUlZGbHc3by9mNEJz?=
 =?utf-8?B?Q2d0aGxESlE1eGVnaXpZOHJhZFgxWTdlQklWRVIrN3VHRzJxWStDd0dnTnhG?=
 =?utf-8?B?UVkwbU0xTGJGQmFTTmxxd0pVc051UUNUN1VyaHBLbjFrMFhIVFB0d3cyNXEv?=
 =?utf-8?B?ZFd3b0dhTit0NHdsOHEvMEVjaWp0Z2sxMXB1Q1c5eTVYQ3BoeXVSREZnMlZD?=
 =?utf-8?B?T09ZWlArTXZsWG4zeUtWM2lSWE1tZEhqd3ZwQnEyejVhTitxR0xxS0tkVE5o?=
 =?utf-8?B?VnlpOXh1NEMwc3R5STB4b205OXZKQjZ6MlRYbzN4dWRoT0U1Qk1BblFwMnVp?=
 =?utf-8?B?d1lETlpCbVN3eHp4WFRiWGxjVUMwTDdONDBzWnR1b0dxdUhHd1dtN2Z5OGRN?=
 =?utf-8?Q?hvS8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWtGVHg3UnZmeEozUUswdVJlYTBIQmxweHZaYmZiM0FYOHBnK05NZjVNemZX?=
 =?utf-8?B?NHJIL1kyUkQxbVVPdm5tTlBaVmFmaDVRL1J1R2dBTlpYL1dPTkFuWXMvbHFM?=
 =?utf-8?B?RmtMWmJmQm9UcDFJTW9pSEdud1pNYmxkeWpia0FxbGxZMUp5cDZvVXlWK3c4?=
 =?utf-8?B?N2h3RisrRzdjUk1HYWR4UHMySnNuWGJ4QWttTTZzbWFuQUtoUVd2bWMxQ1Rx?=
 =?utf-8?B?NzhuOXUybDVXL0lCQ2JqdmxuM0FybVIyUC9hL2NVSnpkZXdieGVpRmlja2dK?=
 =?utf-8?B?OU52RDM1aEtZaE54ZGRDZXhmMVkwMDlOU2R1MC9jMnFGbld1ZUhZdWJVTVdj?=
 =?utf-8?B?d3FLRFlVdHNwZ0VsMDBRc05nZE1pMm5lNzU0QTdEZEphdFAwRVc0VCtCOEx3?=
 =?utf-8?B?UVZ2YlZEQ2lHWFFUbHc5SXVDdjZLWGI3SHNaTEtIYnVpOGhQWmszRXJzTVFz?=
 =?utf-8?B?bGsvNHlYV0FwbXBXVERoSklObkJ2RE5LdkZ4Ujg3YzhFZmdkdTlWcVlIOWc0?=
 =?utf-8?B?SVEvZGc5RDZRekF5NmszanJkcGNVRElNdU5Na2t3Z3J0cm1SOEN3MW94T0hS?=
 =?utf-8?B?bjVNSGJOMDJWaVlUYkZxbmhuSWVlYy83Q0cxV0VPMStIWHdtd1FZcGZTbmpQ?=
 =?utf-8?B?bkJ0dW5yQVpHNEI1aWpVZkM1R1BubCtEWDlaaDgydUd1dGhsd0xWMEJxb1Ju?=
 =?utf-8?B?T2xITDU0NnNvUGxCcWVEd1FWMnF0em1KRVFtdVhzOVI2ZERiZ0dpWE9XRUts?=
 =?utf-8?B?dDNMYjdKNTFJYjM2TkN0aXFwcXk2U1cydWVTZzRIMFp5V3VFeUxZeEY2ZlVG?=
 =?utf-8?B?Y0VFaHk1T1dCSkg1SkZiWUo4SWxacC9aL3lJNG9uN1NsTlFlMTZxZDNMV0Fk?=
 =?utf-8?B?MldSc0RtNmRNYVdNQVp3M0pFczBRRzV1V3RFc01scEY1aEttb0pkMWE3SVRp?=
 =?utf-8?B?eXppcUdjbVdwb01Nc1lmb1h3dXcweEJQWnhSRlVlem9ocGY0dXN0R1BkOTJ2?=
 =?utf-8?B?Ymp5VXRmL0lPbU1lNXRaS1JTTDYxTXZ1NFgwYTNhWkh2eGhiZnhBQUM0R0s1?=
 =?utf-8?B?cW84VzlBVHRiNG5yVHRObHNidHRQRWF6VUV1L1NyOGJMSWJpRGJPVW5Ib08x?=
 =?utf-8?B?NWVwd3l2OTJQVDlldWxpTmRVNVZOTkRlcHNGRUJZbVZMdUJIdGI1MGh4dzNn?=
 =?utf-8?B?RGtBa3pUblRBRWdiNGxJRjh0TTlvQ0MvVVJVWC85dnkvaExPMjF2cDlFM3F1?=
 =?utf-8?B?Vk5xN3M1R0FyVzlmNlozdEE1c0xXeWc3VkF2R1A0VkdSWkJ5MnlGdXh4eDNI?=
 =?utf-8?B?OTVTOWVodnlDaC81ZVBmN1BDL3dvNjJMNXE4cDNndWVHUC8raDM3SXdSSVVB?=
 =?utf-8?B?TWJaQ2FKSVluczJhMGR2T0VkT1UwZmlwQURGeW9FY1o0V0NJeEJuUGV6Tkdu?=
 =?utf-8?B?U1VDRDYrc2orbGVzZkR4Z2YvVnhxMTllWjVhMzMyM0ZsaXEwRFB5TFJZcjlY?=
 =?utf-8?B?dURjUEVFZGQySDhCaW05N2JxZzVLVmlCMUIxbTNMK2xZelZoNUZIcGt4R2lq?=
 =?utf-8?B?eUY0a1h2dndtTHM1ZDZPWU5ZbVNON2tGUEdDVEd6MWM4L2pQQzJsaGp3QkVk?=
 =?utf-8?B?R1VnS0liVjBFWDE3V09BTGRWcjhCNzNmYXJUUW02SC9HODZMUDRVMHlISlI2?=
 =?utf-8?B?Z2E5cFpwVDZGQTMrMnBwd1ExcmhTNm9zY3lkTFlQTU4wVnNDek96SmpQbU5j?=
 =?utf-8?B?d2Fpb2VDWmpHeE11blFuOWtQWmxmQ1d1N1pIUG9POEF4UU5pNkhyV2dsSzJ0?=
 =?utf-8?B?UHhycUY1WlN4Y092UjlFQ1UwZ3FxOFNnMUVLczZyY3gzdFE2SDQyU09FcVJL?=
 =?utf-8?B?Yzh2TWdqSjFTNTB0TnpHUUFDUGZta28rQWhSWFlHTXh6aEJiaWNaaHZaTDRr?=
 =?utf-8?B?Y2g1MndvY01OdHBpd2x1dEtmUUkvaG1wQUNpenMwMEhJbWZKcG5XcG9YZHlU?=
 =?utf-8?B?c1RQYllYeHNLSWZ6OHN0WkQxV0h1NlFVcW1oSG4zZFVYZTlCaVJ5djVLTHBp?=
 =?utf-8?B?Y1RVRStnQjk2emNMQ1dzYTlRejE2WlZaRHorTnNuWUN1OS9ha2g0V1FQOFJp?=
 =?utf-8?B?Q2Z2aklpZlBXcCs2dnRMY1lQNXhTcjZ5VXZGTXB1OS82WS8xNjNsOWpjWVB1?=
 =?utf-8?B?MDI0OUhaVEg5UjlkU3pLVTdTYW9DMDY2cTQyM2tNQ0x4Qm5HK2dmTHdTZTV6?=
 =?utf-8?B?T3pZNzh2dEZrTnZEV2pBZkxZTFZIa05wSitvQnJUaE10di9mUmQxU0c5YWwy?=
 =?utf-8?B?NVU4T1VlV0lXOS9WU1NVK3h2MkVOL0JFMFB5OFhqbEpaam9rYmphQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12852812-281e-40e2-2f9d-08de6e85e98d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:37:36.3993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CNxduDLZyGIciS7pquahSLDrddU+NabJeuLhARmF9fpNC2jPZBw1J9ZhpMf7aRGmmMShgALYyCd7DriKwG3Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5877
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

On Fri, Feb 13, 2026 at 02:55:59PM +0530, Tejas Upadhyay wrote:
> Starting CRI, Include a sysfs interface designed to expose information
> about bad VRAM pages—those identified as having hardware faults
> (e.g., ECC errors). This interface allows userspace tools and
> administrators to monitor the health of the GPU's local memory and
> track the status of page retirement.To get details on bad gpu vram
> pages can be found under /sys/bus/pci/devices/bdf/vram_bad_pages.
> 
> Where The format is, pfn : gpu page size : flags
> 
> flags:
> R: reserved, this gpu page is reserved.
> P: pending for reserve, this gpu page is marked as bad, will be reserved in next window of page_reserve.
> F: unable to reserve. this gpu page can’t be reserved due to some reasons.
> 
> For example if you read using cat /sys/bus/pci/devices/bdf/vram_bad_pages,
> 0x00000000 : 0x00001000 : R
> 0x00001234 : 0x00001000 : P

Riana, Raag, Aravind, a good new use case for the drm-ras no?!
Thoughts?

> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_sysfs.c |  2 +
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 78 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  1 +
>  3 files changed, 81 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index a73e0e957cb0..e6a017601428 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -14,6 +14,7 @@
>  #include "xe_pcode_api.h"
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
> +#include "xe_ttm_vram_mgr.h"
>  
>  /**
>   * DOC: Xe device sysfs
> @@ -284,6 +285,7 @@ int xe_device_sysfs_init(struct xe_device *xe)
>  		if (ret)
>  			return ret;
>  	}
> +	xe_ttm_vram_sysfs_init(xe);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index cb3394000e83..c6a81ccaa9d2 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -744,3 +744,81 @@ int xe_ttm_tbo_handle_addr_fault(struct xe_tile *tile, unsigned long addr)
>  	return ret;
>  }
>  EXPORT_SYMBOL(xe_ttm_tbo_handle_addr_fault);
> +
> +static void xe_ttm_vram_dump_bad_pages_info(char *buf, struct xe_ttm_vram_mgr *mgr)
> +{
> +	const unsigned int element_size = sizeof("0xabcdabcd : 0x12345678 : R\n") - 1;
> +	struct xe_ttm_offline_resource *pos, *n;
> +	struct drm_buddy_block *block;
> +	ssize_t s = 0;
> +
> +	mutex_lock(&mgr->lock);
> +	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
> +		block = list_first_entry(&pos->blocks,
> +					 struct drm_buddy_block,
> +					 link);
> +		s += scnprintf(&buf[s], element_size + 1,
> +			       "0x%08llx : 0x%08llx : %1s\n",
> +			       drm_buddy_block_offset(block) >> PAGE_SHIFT,
> +			       drm_buddy_block_size(&mgr->mm, block),
> +			       "R");
> +	}
> +	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link) {
> +		block = list_first_entry(&pos->blocks,
> +					 struct drm_buddy_block,
> +					 link);
> +		s += scnprintf(&buf[s], element_size + 1,
> +			       "0x%08llx : 0x%08llx : %1s\n",
> +			       drm_buddy_block_offset(block) >> PAGE_SHIFT,
> +			       drm_buddy_block_size(&mgr->mm, block),
> +			       "P");
> +	}
> +	mutex_unlock(&mgr->lock);
> +}
> +
> +static ssize_t vram_bad_pages_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct ttm_resource_manager *man;
> +	u8 mem_type = XE_PL_VRAM1;
> +
> +	do {
> +		man = ttm_manager_type(&xe->ttm, mem_type);
> +		struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
> +
> +		if (man)
> +			xe_ttm_vram_dump_bad_pages_info(buf, mgr);
> +		--mem_type;
> +	} while (mem_type >= XE_PL_VRAM0);
> +
> +	return sysfs_emit(buf, "%s\n", buf);
> +}
> +static DEVICE_ATTR_RO(vram_bad_pages);
> +
> +static void xe_ttm_vram_sysfs_fini(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	device_remove_file(xe->drm.dev, &dev_attr_vram_bad_pages);
> +}
> +
> +/**
> + * xe_ttm_vram_sysfs_init - Initialize vram sysfs component
> + * @tile: Xe Tile object
> + *
> + * It needs to be initialized after the main tile component is ready
> + *
> + * Returns: 0 on success, negative error code on error.
> + */
> +int xe_ttm_vram_sysfs_init(struct xe_device *xe)
> +{
> +	int err;
> +
> +	err = device_create_file(xe->drm.dev, &dev_attr_vram_bad_pages);
> +	if (err)
> +		return 0;
> +
> +	return devm_add_action_or_reset(xe->drm.dev, xe_ttm_vram_sysfs_fini, xe);
> +}
> +EXPORT_SYMBOL(xe_ttm_vram_sysfs_init);
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index 5872e8b48779..6e69140c0be8 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -34,6 +34,7 @@ void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
>  int xe_ttm_tbo_handle_addr_fault(struct xe_tile *tile, unsigned long addr);
>  void xe_ttm_vram_dump_allocated_blocks(struct drm_device *dev, struct drm_buddy *mm,
>  				       struct drm_printer *p);
> +int xe_ttm_vram_sysfs_init(struct xe_device *xe);
>  static inline struct xe_ttm_vram_mgr_resource *
>  to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
>  {
> -- 
> 2.52.0
> 
