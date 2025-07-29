Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC687C87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 08:39:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CDA10E1D6;
	Tue, 29 Jul 2025 08:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hs+cNLAb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13B510E1D6
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 08:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753778363; x=1785314363;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rcoYgKuIlz5sNx1A6zJ3bKAXEm+AbqMC6xPtYOVBfIo=;
 b=hs+cNLAbBMQC3xmNvYU6oB5in3BULshFcajcC4/u9uNbxRmKWQEBAvvE
 Io91xGz5bSHVIQZeHb/aBbUcU8J4a6YmXlOEyvn5Jw/D3U+Dwo+cgXeoJ
 IIgIsnYSdZHwPyY1uq5GC6vLFAFFecEjcgHm+6FuUtjCLR6dQxjER9wbv
 Mr0sHA1pO0PaewMQZsPydstHvg0ldf21h4L45Cn/O+mIpDPa3IWRR9FFD
 oK8+FKCsZFheFa728jkbmTwU/fr1GtLFPii178FRWv9uzmRd6CWgrcXaQ
 zVpRoshSQgHvRS8SEc1S/KmX+Bc2YrXWqask1d3uq9fgHXRUaTs/mRWE2 w==;
X-CSE-ConnectionGUID: SEfq3sSaTbGIPe7+4fpXTQ==
X-CSE-MsgGUID: 0C2MtTMCRkSgjxP3wxX/SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="73624875"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="73624875"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 01:39:23 -0700
X-CSE-ConnectionGUID: 84RGTzI6TQWtgyfutZc4Fg==
X-CSE-MsgGUID: kHsjBZROQYWHYY1EhltigQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="161908957"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 01:39:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 01:39:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 01:39:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.80)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 01:39:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AaxOISj6eKBmlnKDFeO9ZhPsu/zgfMueo2GLMnfqw2dx0e7ALpfpTWMB7JFbIqn9Me93srmkxMPwboZD04ahueSiJ9XK+dEcSrSVjBXS4IWNmNhT5ywTjhDdBNuAPMG+4w6B+otlSDrSwHfjdLWu4ZsTdOqsFtl/9Em7bgvM5aaNfMUAxcZHf3AcEVpnjInw2RESLvxxmgLZXfTrzpMAttvJq3TIxSQbn5nF9IebFluYD84W2qZ3ROrYiNqKziO106dqfXw0yyTI3bfAZDXs+oZD9cJ+2OQ3H84SzD4O0eJcwspdR2wqHw6KzGQ1CL01YlO5a73dEn4YBTxRIyYdQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cyeo6mp2gntdaOlckGDTXAKLKwPQJYujBpqLQgsP3E=;
 b=tnslIE5Yx/btJ5M9yk+Yj0ruY49Y/doHZzcMUnwM3Aj1TVlCEH3WBfpp4AJk7asM5miqHRMsNeQ49FynVkNRMAUCzBsZOS7ncr2ZZNg1HkBAvya3J8rqh8xe1JuTeyw9TRfc6Cz2+9e3g7KrEh5xkejCTdoiiIIz/oSkx3QSa2BpEQnUBDW18XOhV5j6Qr7BsbuDa5XBQYBK2QoRYdvd5OFR9hwLd55zhQgD9JBqt1RAsFrNdG2/3P3h3/ZHvXAj6zA4djIwK0/7tcO2anHubOIbsugkMBSOtb5eElRHPlqNdDH3lKhEHvkapq4QzVCHiFDusVNjQ7TYdBhfrwExDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ0PR11MB5865.namprd11.prod.outlook.com (2603:10b6:a03:428::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 08:39:19 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%4]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 08:39:19 +0000
Message-ID: <0aefd057-8ac6-41d5-8e5f-f15f8d1d75f1@intel.com>
Date: Tue, 29 Jul 2025 10:39:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] drm/xe: Simplify module initialization code
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250727172009.587-1-michal.wajdeczko@intel.com>
 <20250727172009.587-2-michal.wajdeczko@intel.com>
 <a9c97f83-eec5-4b16-96ce-803132287548@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <a9c97f83-eec5-4b16-96ce-803132287548@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0037.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ0PR11MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c585049-6944-4cf8-b0ad-08ddce7b68c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RS9QY0FPQy9tcnUyRFMxdmlZd0RvMDQ0azJTL3AzL2tTZFBsN05pbEplRU9Y?=
 =?utf-8?B?YmZIMVArUThXUTRjNGNBM1NjL1FNemFvZjhtaERNMk43MWE1eDJrOUFOcGNE?=
 =?utf-8?B?QytBZlZPVnYvZUdkWERYR2pSdktiRHhxNnZqR2hnRHNTclVpM1pEbk9wVk9S?=
 =?utf-8?B?aHUvcEFMSzE1Q1k5K1FXTUljRlVKRzBPMFEweGdqL2RhaisvSVNnSkt2N1JE?=
 =?utf-8?B?UkxZYUgzNEZkNmtkWE4wNEg2UFZpK3I0dmZTV0l4M1RqcmFvdHE2VHdGK1ZW?=
 =?utf-8?B?bitqbWRIb2krZU16cUVBay8xY0d6UXQyUmN6c1NYcVZubU9SS3ZwckcreENp?=
 =?utf-8?B?Y0R1VHIrcnk4Wmp4N3BndUNwRGJySmRUNlFybHVodHpTZTlBMlN1V1RCRTNk?=
 =?utf-8?B?M3lCVUVTUURMZVhMRnBpSFNjTzBQYWtaQmZCS3BYZTFJODNHNG5Ha0RhV3Yz?=
 =?utf-8?B?c3poZXVJQ2JaY2piTU56UzNVWWV0ZTg2VkNma2hLay9Pd3lkMW43OFhaM245?=
 =?utf-8?B?UXBFcnFtY045WTRHcDR6R1MvYld1cnhGU0RpTXEvQ200NWdscWdhYWorNE5J?=
 =?utf-8?B?R2c1NDRqNFRqbE1RVlFGbk1QaGZEVSsyTCtFVnVkc1JxZlJoSC9RbmFqMzU1?=
 =?utf-8?B?Vzlzam5IVDFvSjBhL3Y0QTZwdTRRNDVzcnAzV3IwNlBTMG5MNGp3cEtmQ3J4?=
 =?utf-8?B?WlN5NUY2MVVQbFpUNGV3ODVHbWZoSXk4c0hMcVQ3V0JxejR1Z09lVVRVM3BY?=
 =?utf-8?B?MWx4TTY5S1ZPVjlEMVVSVjhJY3ZQb0ZjaDFCajNRcER4TkxZcXpsRFJSS1ox?=
 =?utf-8?B?VlhjaWRONjlCOGZYcXpyQVd4aGhMaFRUeXkvYklRWnczODVnbkpVWXB4MW5s?=
 =?utf-8?B?UDFjK0x2bm5iVUVFN2NQRERQdmx0blRIRVdSM2pVa01yTnA5a2NDcjlSM3Rx?=
 =?utf-8?B?MG16cENBT21iSGxRSUswcVNLdWNOTE5VOFlKN2NFWW51NXE2UWpYYTJsYlZv?=
 =?utf-8?B?b0t6S251ZzZmOVRlNklCUWJJZ0R1N1kxZ3dsaXlXL1dQOGZGYkk3SGRkbFJM?=
 =?utf-8?B?eWpUVmhITUVnN0tVL3dsdi8xODNUaHlia0RnNFVadmpldXNiUStWRDl5LzFN?=
 =?utf-8?B?bjdyOEpoNXlmdUFySUJDd1lpOUpIcE95TEFFWktxMjBiOWUyREFYOFB4UGky?=
 =?utf-8?B?amZhUDJndmlENEEyb1FnWWdCaTdCdHlnenFLOTlqT1ZTM3ZBZStnUkwwRTk4?=
 =?utf-8?B?eElRd2Z5bG94U1pJRjQxenk3NUJYOU9RL3lwZ3Z5ek9qWktOaXV5VE9tK1Y0?=
 =?utf-8?B?L3NCM0EwTTcrYUZ1eWUwUHRud3YyRHFHdE5UVnRIY25NajdOanptSmxMMk5B?=
 =?utf-8?B?RVNnYytjOEY4M1lpWnBiS2p3VzEwMmFXVm5Mb0xsK2JNVlc3ZHk4bFlLRloy?=
 =?utf-8?B?YTVvYk9yb1FvVWllbWRkRFFVNDAxSHE2Ryt0MEEwMDgvQnFiOUhJV2dlamdE?=
 =?utf-8?B?ZzFqTDZReWtabXY2VkdOQzN1L1lGSEY5L3E4VVVLZCtSWWdWeXJNTW5nL0p3?=
 =?utf-8?B?YXRYYlo5eXFBN1Y0dEQyS0RvZE81VnZ4bDJydUMyektSSVljemdTK2JiZVEr?=
 =?utf-8?B?N2ZVQytqWWk2WjUzODdmUFRZRVhCVWd4ZUhKSlRwaVBMUWxYOEpYQ2g5Unlu?=
 =?utf-8?B?bDdEK0pQUjlxOXE1SW4vTUJ1b21LM08zam4zYzJycFUyRzFEMy82VmlTdHZw?=
 =?utf-8?B?WGFrcUlKQWxaNXZoWDQxYTJvQ2NxbnRxeDhVUUR4NCtMbGdXQk9vN3E4Z3pF?=
 =?utf-8?B?R3hMQkpUbzhtZE1Fc2hDNGhybUliejJ0SmFtSVFXR0hlS3RWS1ljM0ViZzBp?=
 =?utf-8?B?VmlHT0R6K2lqd0NsTnhYYVUxRTF1cUFtcUxuT1B4bzhvbCtkR3d4L2pBb3VJ?=
 =?utf-8?Q?m0l7VFva8zY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N05LNzF6SzlQN1Q2bnlwQ0ZqS1hZSW43b3MxRGxwYXNLN1NNazZSWkJ2YUFz?=
 =?utf-8?B?d2RuTXJpTVp2dHd6TnZXR01FTEVtWE9Ha1NZQXJ4NkxjdWcrMW41OHo1Y3hn?=
 =?utf-8?B?UDdhYXAxME9lYldyMFB2bHVzUkZncHVpRUhacWs4MUFUMGNjTFEzRXp5QmJL?=
 =?utf-8?B?eUhYWEFPUm03ZnZCS1dXRWdTOVJDbnQvRkoyMm1raTVDb0lMaENWK3p2UjVT?=
 =?utf-8?B?ZjFUREJ5UDV6d0xDT25JL2N6bUFuenZRTFloRUUwNVA5dVlXSUZ4SFRBaC9x?=
 =?utf-8?B?RXIrSExGSTdqWCtKOXorcG05L2ZpRnVzbVhLdnMvT3hnajRYTElrckc0TlMw?=
 =?utf-8?B?Mi9JV05rQ1hhNnlMYlBXeWJpSG9qYkdSdnB5R25pSVlxdHBGUjVZUGlNd1Er?=
 =?utf-8?B?eC9FZ3h1Z1RHUzRtU3B0cFJ4aCtZNjVwdEpmVlJmR3lNM3drOFR1d0hteEpl?=
 =?utf-8?B?a05EQjFodWxETjc5U1Bnd3lnOXpDMVA5VDlaWUFTczRuUmFWL1lDWkNnSmk2?=
 =?utf-8?B?bVdXbUFDelJEdStMZW9GN2dzKzEyNXVPMjhLTCtCeEJKV0tLcndzWS9KL1RF?=
 =?utf-8?B?enNUVUQ4WnFncWhkbzdSNkZoeVNHMDVjTUVPZTFXazNKdlFZYXVZLzdveUEy?=
 =?utf-8?B?ZVpza2NjclBxMzMxUGZzbk5VOWdUYXNHWGhQdDJVRnF1dWdZV3BwT1k1VXd3?=
 =?utf-8?B?RDlISnRpekl3ejdrMXVyalB5UHV6TjdJRFJtTVVpT3MrcU83bDMzRVFoRHI4?=
 =?utf-8?B?YVhpRTg0bFFOM3VFdXJUNWQ4ckp0a2MzU01RUWZ4ZE52aDVYdTgrcFB2N1dC?=
 =?utf-8?B?K2pucmY3aDRHNGpsdGYvc1JpalJjQVEwcUkvZUdSa29rVmJjWkhBNTNBZkRm?=
 =?utf-8?B?TnkyUHVtSml5L05UZGljeS82SzFNbzBPYzd2dVJMcmZBdEk0RzZmL1grUHI5?=
 =?utf-8?B?NWt5ckpLS1FoNG9vRjR2RW5nUFZOTndDcmorZUVIZEZtUExaL0JpeWJvVW12?=
 =?utf-8?B?dk9rZFNTbDRzWTBnSzk4dG1LNlMyUzdjMlNsYm8xNG5NT1VYODVxckVtNFg1?=
 =?utf-8?B?SkpyY2JFS0lzVnJvRTU4M1FyWUdzaFVORTdUUEl1RlA0SG5wQS9rSmJPWW9Q?=
 =?utf-8?B?dHRLV2xPNzRQMjZKcVhPNkhYVnJNenhKOWZWaFRmWnQ5Um9VZnR3YU92L2h6?=
 =?utf-8?B?SFZyQkkwaDcrbk9FRjFQU3NvZUkwYjU5REVkMnhSanE3UDNOSWZPY2ROcWY5?=
 =?utf-8?B?Z2dNZW9CWkVjRHRWTEpOTEZiVGhYVHFjNzJDd0JvaytCRmdDdGoyeEFFYUor?=
 =?utf-8?B?aVZrRHBpUEh2YUJOY0RvSUI0TnlwMExRU2tzUGJCWnhZZXdvZlRZUG1FNkVq?=
 =?utf-8?B?SWZDdjBJMlExZ0dQWUxpOHk3eDRncURCNm5oOWs3MERPdWEyVEtXSnJrTXlO?=
 =?utf-8?B?amtXWkRxL1NaSmxkNkRzQVhwSjBNWmhhVVhlL0krNDRpcjROVGFpZHNsdjlZ?=
 =?utf-8?B?K0ZTMG9iYlp3YWZpK1gyNnpCbHIweVhFWk9uMEFhK1NvMnZUVEk2RGhGRzFL?=
 =?utf-8?B?c1JiYURUYWp0UkIxYnhsTjYrblpBczJBZFpaL1VsVmRDeDBVVUd1LzczaVU0?=
 =?utf-8?B?UEp6QWVhZTdwY0E3cU1EV0NueURqVXFkdnhIVk5UMmNIa1FwSEs4Ymlka3Yx?=
 =?utf-8?B?S3FaOGZrRDFZZDZxRzBwYkxXdDFRaldaMTVTQ0Q0N0lKMG9MV1VpL1p0UUl5?=
 =?utf-8?B?NnRiMjVwRnA1UERwYlREa3loUERpZzlSbFo0bE14ZTBXUks0VzROSVF1UnVC?=
 =?utf-8?B?TVNPdWlQOThZbGxUQTJORmdSTVJUdGw4cHNyMTFoSDFJSWxDM24xQ3lOTm5U?=
 =?utf-8?B?Rm1wWlVtRmVVMkx1T2hESkdka0o0UFB2Y3lVNmNreUdlRk9ML1JUV2tPS1FG?=
 =?utf-8?B?aDh0aVIxT1VVWHhnZjRiT25HbWNtdDUrUGdkV0RiSkV3MVQ1K0VBeG93eEx1?=
 =?utf-8?B?WFJmSUhiTlFFajlLSlpyNjgrUTduOHYvY1hRby9DL0ZFQk9Rem9KZ1h4azM4?=
 =?utf-8?B?Qnp1QXhGU0ovYVc0blMyZlprcVFGTXR4LzdDMVpLRzI0a0JPTVN6SjBuWUht?=
 =?utf-8?B?cW9VVm9CUDk3a3FQTU40T0JNK2dGTldiQW96aXZnaFh1RTZnMlFtalRESGh3?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c585049-6944-4cf8-b0ad-08ddce7b68c9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 08:39:19.3170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98FBz8bFVwu1ebytL0TbZzVq5yOdGYoRw4m3nUVZ5adEgLiak7cPNu8DqhNecUktQy3C1mavm/yRSLPewf+cK7LrmlRriL85S2LCL5sh9P4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5865
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



On 7/29/2025 1:52 AM, John Harrison wrote:
> On 7/27/2025 10:19 AM, Michal Wajdeczko wrote:
>> There is no need to have extra checks and WARN() in the helpers
>> as instead of an index of the entry with function pointers, we
>> can pass pointer to the entry which we prepare directly in the
>> main loop, that is guaranteed to be valid.
> Not sure this counts as specific to configfs but it looks like a good clean up.

it becomes a prerequisite due to cleanup of xe_configfs_init()

> 
>>
>>    add/remove: 0/0 grow/shrink: 0/4 up/down: 0/-180 (-180)
>>    Function                                     old     new   delta
>>    xe_exit                                      109      79     -30
>>    cleanup_module                               109      79     -30
>>    xe_init                                      248     188     -60
>>    init_module                                  248     188     -60
>>    Total: Before=2774145, After=2773965, chg -0.01%
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_module.c | 27 ++++++++++-----------------
>>   1 file changed, 10 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> index d9391bd08194..593bc9e5851a 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -135,24 +135,17 @@ static const struct init_funcs init_funcs[] = {
>>       },
>>   };
>>   -static int __init xe_call_init_func(unsigned int i)
>> +static int __init xe_call_init_func(const struct init_funcs *func)
>>   {
>> -    if (WARN_ON(i >= ARRAY_SIZE(init_funcs)))
>> -        return 0;
>> -    if (!init_funcs[i].init)
>> -        return 0;
>> -
>> -    return init_funcs[i].init();
>> +    if (func->init)
>> +        return func->init();
>> +    return 0;
>>   }
>>   -static void xe_call_exit_func(unsigned int i)
>> +static void xe_call_exit_func(const struct init_funcs *func)
>>   {
>> -    if (WARN_ON(i >= ARRAY_SIZE(init_funcs)))
>> -        return;
>> -    if (!init_funcs[i].exit)
>> -        return;
>> -
>> -    init_funcs[i].exit();
>> +    if (func->exit)
>> +        func->exit();
>>   }
>>     static int __init xe_init(void)
>> @@ -160,10 +153,10 @@ static int __init xe_init(void)
>>       int err, i;
>>         for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
>> -        err = xe_call_init_func(i);
>> +        err = xe_call_init_func(&init_funcs[i]);
> Would clearer to write as 'init_funcs + i'. The compiler should generate the same code but &x[i] is technically a reference to a derefence of an arithmetic operation rather than just an arithmetic operation.

ha, actually I had that this way, but decided to switch to
more frequently used &foo[i] pattern to avoid pushback ;)

but I can still make the other way (as now there are two of us)
> 
> Either way:
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

thanks!

> 
>>           if (err) {
>>               while (i--)
>> -                xe_call_exit_func(i);
>> +                xe_call_exit_func(&init_funcs[i]);
>>               return err;
>>           }
>>       }
>> @@ -176,7 +169,7 @@ static void __exit xe_exit(void)
>>       int i;
>>         for (i = ARRAY_SIZE(init_funcs) - 1; i >= 0; i--)
>> -        xe_call_exit_func(i);
>> +        xe_call_exit_func(&init_funcs[i]);
>>   }
>>     module_init(xe_init);
> 

