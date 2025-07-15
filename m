Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787DDC83F1D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 07:20:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BCCB10E53E;
	Tue, 15 Jul 2025 07:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWa7qMJx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A65910E526
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 07:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752564008; x=1784100008;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=j+26TUkgcL90HxQxKtF+FdwPZZi3zhy2PJheKDEnxJs=;
 b=NWa7qMJx7I1Y9nPJ4lqVSX/UtPl7R+SU9iVXQMYthBsbNabnFqYxhivP
 N2W7U28U54gXLPYpigtEY8TNXWOfu4fDyRm8er6SzP9J1qlQhkOmsKNGm
 jsMK4OdMH8ADShQUXfwRn1zm9TRRqdOtgeRLCvtoW6IriKozZQ1gmQ4jX
 JwqBAyjS7gsZ6qAmh0b/YoDPgY4CH0SFuJl7wE64Dewm08rUqpRuoICf9
 Re1m12YgmadqnKEIKd9yL5OTRwNoYTMgv+TuQo7emOo6P6Lt8Tc2Qe3xQ
 NK4JvEIq8x8X8eABpukRNLNDNkIxOyBrTYRy7+pRMplbIKPPSI6xVRX8B w==;
X-CSE-ConnectionGUID: EzE2BEEtTfmTKCAM+mIlrw==
X-CSE-MsgGUID: qIPMv8jBSG6oHZf74gxN7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="77309380"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="77309380"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 00:20:07 -0700
X-CSE-ConnectionGUID: xc08z9xKRb2PtbEgigks5A==
X-CSE-MsgGUID: a+6gh9liRs2UCrSAQ9O60A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="162802442"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 00:20:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 00:20:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 00:20:06 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 15 Jul 2025 00:20:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+XSA+pgXMtL5auyXOZjDAg2O35i6/MUjIWh4cEl0okwB0YmHIY50/0Zt56c0fvzku1rSMDeUZLIWAXFO6ephNfkQb2Uo+bIET/ZLUpSM73DYUmn7LTK/XJXx5QWXHToylWes6dTemyulNCO463UMgG29byEcmBl78l673c4e+mCj5tCcLxBBu/H0QrKlLCMFC1YQlUUfaxaIJQCu8QT00vI5eqcFBmTcv9S1Cbj7j32YoIue5arlGrXuPamF24kIvovejndHib5T99GoDhieZXcD2sntBHt8m0wByICvow4VRBENxLCwRM5Ml6bRunUhprNRPIo+DLNQkIeKj967A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBBfONf/IVXAHAYeMAckbVqNN2Wdg+IvVEDeuVA/U5U=;
 b=r9Y93nxqmcYpnNs30K3FKE7f/HwLRzG+1QbWKDnxMrFJoo6kF6MQsVQRvK0INBhY/aS6sB256ZfZdzbQ+gQsmvsuvlXgLC4nK7lomdZj+dRHeL6Xc6lSDz5JtP9VJtdnBdewf05sZmukyyJwAns8EdBfunE1CVvwWFo5HDXXSsGwb0s+FZoH785DfsrfPJkq8r57nPhiZdJBpuCe6S+wKrKv14zNeNtE0xlYXp4tUf+P+xHEVWQJdkLA+L2N5GZ4VwGtEEtICd836KQBna8OtymYCHLAlCx4U7voJf4WB+wbkCPSFNQeshdoUreDPofvhrVdB2Aa+O3IkyQbTKPAEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11)
 by BN9PR11MB5241.namprd11.prod.outlook.com (2603:10b6:408:132::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 07:20:02 +0000
Received: from CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74]) by CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74%4]) with mapi id 15.20.8857.025; Tue, 15 Jul 2025
 07:20:02 +0000
Date: Tue, 15 Jul 2025 09:19:58 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>
Subject: Re: [PATCH v4 6/6] drm/xe/pf: Invalidate LMTT after completing changes
Message-ID: <20250715071958.ia3uzleszf46pzyu@intel.com>
References: <20250711193316.1920-1-michal.wajdeczko@intel.com>
 <20250711193316.1920-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250711193316.1920-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU2PR04CA0226.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::21) To CY5PR11MB6138.namprd11.prod.outlook.com
 (2603:10b6:930:2a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6138:EE_|BN9PR11MB5241:EE_
X-MS-Office365-Filtering-Correlation-Id: 483ced01-24a2-4b8d-57e0-08ddc3700399
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmduNmM0LzJqZ2lZODltSHIreVZNYmlEdk5HQTR0dXM5VDhBWkxBTjhJVXJr?=
 =?utf-8?B?aEhvU2svWElPc3h2OGpvREpHUVp2STBnY3lYQ3dOdW92WVZrT3MzTURsS3V0?=
 =?utf-8?B?eXc1SUhXd2dnVnBrVVZBRStQSjM1S2NUb0NqQkdySmswTlo4WjcyQkh3UHpQ?=
 =?utf-8?B?YXZHSVg3eDlONXlzNGpsNG9VQU5VVU9oeERiQ0lHOVVEdjQyUk9uQUxMTFlD?=
 =?utf-8?B?R1Rrc0plRGVqZFpDNnMxT0lMaGNrRDdFMERRM092akpXSGdJQUlNS29lQTJm?=
 =?utf-8?B?M0ZNbGNCNGdqRGU3Tm9Vam0yRWFlUGtIdGFnQk1vY29tNEp4ZWltTnZoWG5S?=
 =?utf-8?B?ekg3SUhqbXdmSVozWmV3cmt2SmtBc2JYaGhVcFBUOFVqeHVmVFNjc1Bwbndi?=
 =?utf-8?B?N3AyTmozTk5hcXVGNVhrZnRoUkp4clVINjZQUGhmby8xd3RxeUpHbGhwU25n?=
 =?utf-8?B?dzhPR0ZEb0pML3JneGZic09ZNk9jVGJuQS9LVlBLWjc0elY2Z0t6eUo0OGFK?=
 =?utf-8?B?aDNGd0lqWVZqdWYwSmpOc2lHNE4xU3UxYzRXUzZRSUdZN3NTdE01aEpRQkdR?=
 =?utf-8?B?UlNVZUxDVVgrb29xbzlmeHFHdDc2aFFjUnBkaWVsemN4S1lMSVh3aHUvNWhl?=
 =?utf-8?B?Q25ISHZydVkrY3B1dmdCMy8yWWFBYzJ2aHUzbExiV0wyemV3ZjE2dVJQdVBD?=
 =?utf-8?B?blZkZDFQYWtnUUszMzB4a1BZcUhoNzhwUXBEMHBrajhqYU5ZQkV0WC9pNU9v?=
 =?utf-8?B?alpOd2hkekhlRFJ1aFRZbnRJQTNwY0Z0QjZldFpCY0FLWlFVeEJBaGJWVks1?=
 =?utf-8?B?bVBvcDFSYmlNYXVBaXVjcE5leXpHRUhEbEJvaHA5U3hzRytWS3NSdXFLYm9u?=
 =?utf-8?B?T3FzaXFuT2pjRWwxWjdQNkxhK0tuUURJeHJldGJDR3JWbXhjZFhUNFAwN3hI?=
 =?utf-8?B?WlBRWFNCd0xCYmRrZFcyYnJpaENxMTdDSzYyUVZ5S0JGMjEzN2dlcUVpdzZr?=
 =?utf-8?B?aE1Ed2szSTFBVWtXaUZQdXMwb2hEeHM3UkxQVFZ2dU9RUzZHck0vSGlvbGds?=
 =?utf-8?B?bTFtRGhKT1RNZGZXQzRHQVNjc3dIczFKODViek8yTVhzaVZ2VDNEeVpjcTBo?=
 =?utf-8?B?bEg3NkRXb2NhS0NraWFialNjdURPVUhTcmtqYWRGMGNyaFdrT0I0Z3k2dGk4?=
 =?utf-8?B?NGtQcndKaThnc3dmc3pSRGprMU1SMmVUT0RQMi8rdjJZaWM3TjBNbko4alBJ?=
 =?utf-8?B?Qk1zTlNUQ2ZndXFGL1F6WjArZGtKVmRTOVB1d05pK2FQdlJEOVpjbFpRbjBQ?=
 =?utf-8?B?SUtVcWxqQ3YyN0NQK1grNTFyT2JvaWhyRzBVUEgxYkwramhaOEV0SjVvNmxz?=
 =?utf-8?B?VVJhVlMxUDJMbUNmRWdFWEhMQzhYMHJXV1UzZVo1ckNGTDhMbzJTcjRWNjRV?=
 =?utf-8?B?YzJ6Sy9ZbGEwd3dOQzNxeDEyaExtMUU0bjhzUGdaYkJXL0REY3BPbktMemRG?=
 =?utf-8?B?U1RvaW5HeUltbTBiRVpmK3pZTzJ4Q0RvVWI1ZHp6N3hOV2JVQW5DS3B2RUM2?=
 =?utf-8?B?bUZoYTVERGFuY3NVUzN3THFCenR6TjRoOEs0enpHaWVndmd4alYvMG5OY3Vk?=
 =?utf-8?B?dTdPbjd5STFJVmxXdFpCMWtuU3Bwb3hqanExdFB4a0xHaUlGZkRvejdySnVq?=
 =?utf-8?B?UGVaRFQwZWQ0ZjZwcVVmMFdqRWlYbXVJY0M2V0NjUzVKemNKYVMyZG1RSTJ1?=
 =?utf-8?B?V0Y2RHBDUjNwdTd0NGRyRHlBYklWY2JSKzR2OGdlQjBLWEEzQlg3d0EwQVNK?=
 =?utf-8?B?ODV2VEVrS3lRcUwxQXJMdEpFT2VlQzNKZ3d2QkExQ2xKVVorem5TdVQyZjg4?=
 =?utf-8?B?NllHYVNNWE1iSU5uSmhqL1hmOEZieStKTkhFUkpMT05EOUFwNUpETmdLcEVR?=
 =?utf-8?Q?9FbQ1FleCQA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6138.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azJHTXJ2dWs5SGdybjZVbk5ScTZ0OXBuRzE5Y0ZRVXdZTXYxdzVyTUdXTU9Y?=
 =?utf-8?B?Y24wT09zMHd1N1cxZzFqOFI0MmhlNmNXSmZ1Zy9FL3VDSWorcnJRZTZPTWxV?=
 =?utf-8?B?L05UQXkxODFvT3JqVFJ5emF2MUtENHVlOGpHeW9VR010MnA1OURQVzhGeGw5?=
 =?utf-8?B?RGNGQ2ZqcldIa29Ob0pkY2xBYzFIZ3RtRlVpOXZhM2E2b2hUanJKejRmbExQ?=
 =?utf-8?B?S2tMQ1Fpcnh5cE5LMGd4WTV1bDhkeWdabDgzbFY2akJ2M0J1cEhtZkJqQU1I?=
 =?utf-8?B?Zk1qNXM5WVNxTEJsOGhiUjhFdWRHQ2dhdDlsTFZhaENiVzRGbzNvcmI5TmlB?=
 =?utf-8?B?UXRaV2d6K1diNm16cThZcXE3MzRTRGs5dzBzQ1Zmb3VFWE5UKytkOExsbGFJ?=
 =?utf-8?B?WWtyUXQ0ZktPalJxLzJtU294ck9xM1p1cHljNGxGM2RvVGx3V1VDSE1KRG5V?=
 =?utf-8?B?STRMeDNPVEIxbncwYk5mN0l3WHNqQi9rMGZydTZEM0N1SlkrWndDMUhWa3pw?=
 =?utf-8?B?ZFU3NVJ0NlR2SzdXNExJT1VUZzZKVVRSdVppWUFwaTIyS3ZOQ1RVYzZ2RHhG?=
 =?utf-8?B?bnllT2VQckZIaVU2Z1grTEpNQmhXMThBT29nTDBSTGNtcWxiNysvVnh2QXgy?=
 =?utf-8?B?VW1HL0lEajJqeWhjSG5UK3pjaCtXejhueHhuOFdkU05jWFBqbW53UmRZa2xZ?=
 =?utf-8?B?aDZ3RXlWRnhoTktlNG5Ma3g3b2pzamdsc3V3Z0pPc3NNS0pXMnduZHBTbmx5?=
 =?utf-8?B?YVgvSm1sTTR0NjhGSEtyRXVId2tKOVR0SFhmalBLeDVYanNYV3N2TTFXWjM5?=
 =?utf-8?B?MzJaTzJhMkxiUDJjak5vWFJNRnl6TnJudmp1WUYySENVN0J6d3pkTnlCTGFD?=
 =?utf-8?B?S2YzMUhyVzNndmpHUjRYcjV5djBvM1NvUlFUZFBFdnhTbzJJL3Q1K3VvS3B4?=
 =?utf-8?B?T2gvVnNJd1ZPK29waUhCUlQrSjRnSEwxTSttZy9OSHdIQ1NkdXdCUWRta3BH?=
 =?utf-8?B?dXVZYVZ3YVRCazc3c1pYTGNMbC9DNzFBRUZ1K3U5d2FvVHNQdHl1SnFwKzNn?=
 =?utf-8?B?K0ZZS0syRzBZYzFhZ0dRS29MV1NrUGxHWnJhSXZqUFphWk8xeG1Ja0FWN2RB?=
 =?utf-8?B?Umh5Q3I3T2NHTVpUdjljVWY0bndXZlUrWit4QmtWV1lrcmZ6VjluNEgrUEdZ?=
 =?utf-8?B?ckl5S2xodjlCc0x6T3F0cThqYkpiTXZJdktyRkIxL094UVozMWdiYmVzUXJJ?=
 =?utf-8?B?YWplV1FVNUlHUWtMMUdiYk1aNkFYakxoUlI2cmVrb3pJa3FlUDVYVzd6YmlT?=
 =?utf-8?B?Nmxqd0RaaUhad0YyRzRCSHpsd0QrZW9zNlE4UlNCMzV2VDdpaVlxSEJsdWdU?=
 =?utf-8?B?WURYMUp3UThHYVgyd3QzVnJHVkZEUUZXSEpmaVp2L3BLMDFHR0M3NTR5aU5m?=
 =?utf-8?B?ZmYxbDkyMmxRNnNwZXJ1eVlNZUtYTTdLenJ1Wm5nZWVjRjV6WmJZOU80NkdK?=
 =?utf-8?B?SlF6VHRnVXZZcFg2bFZRZHVGYzEyUitIV2FBeElhM0g1UmR3ZGpoLzc1RDhr?=
 =?utf-8?B?ZGxEU29FWUZhWHhTU3Q2V3dUNWFjbjVoWnVGYWROZy9DTmplZWNTMndFSlRD?=
 =?utf-8?B?Smw3bTE2SWpFR2g2blI0a1pyTmlkRHViRTl4ekJOMUc0RDZPQldMMzNmdHJM?=
 =?utf-8?B?Y25XWXBMOHBLb0tHQVhqeDZGNnkvbDlIZkc3Q2lzamp2bjJ4TG4ybDU5S1Fk?=
 =?utf-8?B?ME83b2Q1ajljczdpa2dhNzhjQzM3L0VobGFBV3BZalZ1dlJTckticGhodWJ5?=
 =?utf-8?B?OGJYaTlzRVVVWldXY1ZiMzBWY2tIalhEeU5OMFFZcmJYTWhyNjMxREgyZkNZ?=
 =?utf-8?B?RmpPV2FqdnNMM3VGUFpVVFUrOXZjNmJEN0gwbmp2MHBVMjBtbVEwTWRKMjdK?=
 =?utf-8?B?M2l2T1FTOE5jVVlMVUNNZ1JWUjJiZmplVXRENDlZUSt1T3FVNXlVd1RyZUc5?=
 =?utf-8?B?UEJ5K0ZmSTFuZm9oSGhOejlQTld6cytZb2IyNm9TOEJXSlRSc1NabXNwNjJB?=
 =?utf-8?B?bVBxQitMNnpNM3BSN050bHJOZFNWdlJlRFRKSWNRZ0c1OXJzODJIU0JnenJQ?=
 =?utf-8?B?NXpiWXdXT094Sm5SN0tERzhvMVRhVjNhblNnMkQ1Z2FEWU5pMXExNTNrTWFQ?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 483ced01-24a2-4b8d-57e0-08ddc3700399
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6138.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 07:20:02.7279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdaB+7Y5hx3eobn4LjZThwmixiTVUHyuTvlKtq27ae7LXP5zTybUH1nBAsX+dRf4flW7HQOFIr7MqNFdRqgA+HMkwjsbPTrmAfzzYkcPhAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5241
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2025-lip-11 21:33:16 +0200]:
> Once we finish populating all leaf pages in the VF's LMTT we should
> make sure that hardware will not access any stale data. Explicitly
> force LMTT invalidation (as it was already planned in the past).
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 86dade6f1083..0e1c1c19e011 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1347,7 +1347,17 @@ static int pf_distribute_config_lmem(struct xe_gt *gt, unsigned int vfid, u64 si
>  
>  static void pf_force_lmtt_invalidate(struct xe_device *xe)
>  {
> -	/* TODO */
> +	struct xe_lmtt *lmtt;
> +	struct xe_tile *tile;
> +	unsigned int tid;
> +
> +	xe_assert(xe, xe_device_has_lmtt(xe));
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	for_each_tile(tile, xe, tid) {
> +		lmtt = &tile->sriov.pf.lmtt;
> +		xe_lmtt_invalidate_hw(lmtt);
> +	}
>  }

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  
>  static void pf_reset_vf_lmtt(struct xe_device *xe, unsigned int vfid)
> -- 
> 2.47.1
> 

-- 
