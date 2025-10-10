Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771A8CAC5BB
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 05:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F1110E267;
	Fri, 10 Oct 2025 05:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mpOjCs4W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9916E10E267
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 05:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760074172; x=1791610172;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OLYhIZbW4E3FZib4qrdwDgNSsZUZkQbzB2od31R2YsA=;
 b=mpOjCs4WfSCS0kWiq6n+EQBd2UdwNePuOu7/+zxHc1vTALUqCTtk/rBf
 8C9qGJj5yZsg+6e11x0nWCDAj+8x9eTx4+1YUvObNPjqnj5bdSEbZvXsY
 hbS9rqtQzqXbF03zJWcy/6jDMUUGWOi44XoQnXQA0Ikaj+4vWvbaIGX+7
 AuiIfS2mL0VpfeJFhuGVHJQt+zfVrgo7ckfiYeOhaG4rCg6pLHnYKLd2t
 ST7HX8ilhfpQR7GZEBzVw9K2+KImen6+gX97c6luyQqP23xX8Dmcntx0a
 YynZXsqRdc8gHlB5ZbdUmUlhW5AK4TAiKjvoGRD4f9PQC6CbNFhlN9Ovt g==;
X-CSE-ConnectionGUID: Paq4a9XCS5ekgcQvKZJ7Rg==
X-CSE-MsgGUID: Je9asJqtSquR1eO+KE1XqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="49854098"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="49854098"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 22:29:31 -0700
X-CSE-ConnectionGUID: rsKzH6U8RqSrXLjAa4DQfg==
X-CSE-MsgGUID: m4PaYyF7QuOrk4nPzXrmQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="181315272"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 22:29:31 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 22:29:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 22:29:30 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 22:29:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0kV/9fDSV6tMevbtN9mScn73P27IB+BNOnMk47ZePfTeAwNdIQ4LQvRDDjN+UiL7MTV5WQPkjz71UJ6rOaQHk6pRxflSO292vDUiPxebCnHdMyrx00bAkNFZqbiHLC/0x3JOOgBvHcaoAA4VJNqLp67fHdj/X1F7V3TwoxP8qCWk19RjSQ/OST19i5f1GBK+wUfACyTKNharvG8V+AWFNJBP/BNG3EcprygeYIG1HHOtjwY0ut9wp3kI0AkolQ3fRpDeJ6oIIaAJUmxVUreysHzTFwO2i5wdA5d/XNMQpEUcDcmNZy7Yr+KvQ+jGhmtxNswFPYVfxGV+5ArVcKj5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7S0Va0y8/IASdfX/S+kMj0We1s0XCmAXheghY/Z40s=;
 b=boPBjYG1QEmNg8xu4KAQMgQj24am8XTBLTpsstmmIC+3a5ztmojtsLRLKPpJD8Da8q4K2ULk32YmtLXPoax1Wo3FYBIQz0+Xr1EWF10BMgOdwt27kDuCl9ej7IwjLDfN5JjW1O5jWRGD6K/elFtB7NrliIW1t7J4UgKHtRK2nX6wUKX4wGekstoJyA58jKTx+BiOMos/s0V72MnHoA5JFSmzjrDE7Wryi3DMwi8wipSeav42T+5F56NXqcponjnzFDJOfic7p+ILmJSN5vxxiU/bW4Fu+HTqec/RbZhRdlhMt3whtpNHvOcPWOtn+sLgFwFSFktDbZcbk4JZe/FaSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by PH7PR11MB7961.namprd11.prod.outlook.com (2603:10b6:510:244::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 05:29:27 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 05:29:27 +0000
Date: Fri, 10 Oct 2025 10:59:19 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>
Subject: Re: drm/xe/irq: Clear guc2host msix vector0
Message-ID: <aOiZr7FND6P9EeWX@bvivekan-mobl1>
References: <20250930191702.1725959-1-venkata.ramana.nayana@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250930191702.1725959-1-venkata.ramana.nayana@intel.com>
X-ClientProxiedBy: MA5P287CA0192.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::10) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|PH7PR11MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eac0ca2-d1e9-4639-1fcb-08de07bdfb19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkpkM2Z5dmlIQmtVN05VdXJBbzB6b0ZQd3F4a3YzbW1IaUxDb01IbTUxMkVm?=
 =?utf-8?B?NDNZNGE3ekhFOU54b05VV1V2SngrbmRMZ2FWejM2aW9WTHZRL3VxVDdjVkNs?=
 =?utf-8?B?ZlRaNzFHdVFKL1gxNEVTZlN6K3hnaXZlaTdkc3Q0a0s5VWtNQ21TR1B6RDJI?=
 =?utf-8?B?bmE1SS9ydkhPM2taOHV5UExsbG82Lzk5MlVkeFFTclZYQkV6V3NCQnVZV1Nw?=
 =?utf-8?B?cHZ1RjVYbE42RUpOaC93TzRJRk05OWpJM3VhTndjczI3VWRscVUvK2UzZ0Fr?=
 =?utf-8?B?RzlXY09FQldPcTR2NWR0WUZTNDUwaUxJQ2pRd3pTdFhXNWFBUFFkRThYZFJX?=
 =?utf-8?B?M0VXc1dlMlVtSSszTzVkcWY3RGI2RWt4Mk5waHlRK0paL2owSkFhNHpKZkZB?=
 =?utf-8?B?cXA5S2x1dkNSK3pTd1p2cWZIdS9aMS9vVnhWVXc5WW5WV21WZ2k2MCtIV1Ri?=
 =?utf-8?B?Q3MxOHFxTXltSURkRVpUbUFqMjdYc0ZHQTZXbVgyaXBtNFRKVlNSNUR3bkR6?=
 =?utf-8?B?bktDQy9CSGtLNWN6VWhMS3FESGc3MFhUTEVrVWk3SGJEVVZ1VW5kcVZrTnJP?=
 =?utf-8?B?RUt0bG9rb1RSL0RUVW1wSTZOWUNxejdtUWVhZGdnNEVtRnNFNkNjREo5cHBP?=
 =?utf-8?B?SXRVVzEzOGxOM09wZ0Y5M1lpbDZBVWxSMks4bXpQNC9nY0NzOURvc3hKN2Ro?=
 =?utf-8?B?VkU3SFFYYUI0NkNVYnhUMHFLWVdZcmhlc09VLzUvcTg5NmdqbUprMWxTUWlT?=
 =?utf-8?B?QVdNcms3Y3ViakNHZzM2YW05am5yMm1MaHRtZzNxaEZKSkZ6NDFTZnlwS1l4?=
 =?utf-8?B?U0VzUWt2bHFZaVNuZkFIV01GU3lwbXhlMTZDcEpKTEJNR0NzaDdnaDJIckFI?=
 =?utf-8?B?NmxIVVZDUDRMR2dYMnhxYWpoSVVHSEkzbko2aytWNHk4R1BpS2FvNkcrdUVi?=
 =?utf-8?B?eTNkQ1F5djR2NEE1WW5YalFnLzMvQ3l0dnUxVWJ5WjBSZUJpUVZVNGg3eDN0?=
 =?utf-8?B?ZHZqMndnaWlPTXdtRkhMUU9LOW5CQ1ZYNUxYTTc5cjJ3WEZJZ1lpWnc1Nmp2?=
 =?utf-8?B?Nlh5VkVzYy9GdXliQVdrZ1RyQjgxMC9iYmZodWtKSjAxMjByam9GK1BJaEFC?=
 =?utf-8?B?R0dmLzVjSW9HajJIM3FmNlVSSjYrOEVrKzcydmRNT3NyTjM3T2JFeGsrNWtx?=
 =?utf-8?B?NXZYWlNmMU9LWGRYRDVLbHBadndGblAwcFlMQnpwbExGWmwyQ2R4MkxoYnNU?=
 =?utf-8?B?WnV6SldjYm13UUpmUTZyUE5ncFdpWHNCbXVwZjNQaktOekVFM1pHbHBWR3Ix?=
 =?utf-8?B?NTNQUHpKeFd6RWJZaTNzbWVZZnRURGthNklJcVdPYU41Zm56TDFUT1c1Qm5U?=
 =?utf-8?B?Z0FHQVc2WGVIMkxmMjV4MnFTUmdmdytDMkZDU204eFNHYStFQnpMbFRmc2k1?=
 =?utf-8?B?ckRueEkzMTZVS1k1TzNsaGJkY0xTZ0lBVDg4WEI4VWdLRmlCMEJyTlZkcHd0?=
 =?utf-8?B?TUM3UmpSRnBkemtwQnk0VUJKcUllenlRTmNmTG9MbTNrRkdPRVJZRFRscnF3?=
 =?utf-8?B?VHR2TUcrdk1WOUszdnRxeDFUQklsUE9jU2ZYeTBUS3NzMEFKeE5VbjVzNVpj?=
 =?utf-8?B?V1B3WGlYV01tQTJEbTVRNGFtUDFHYmRxczl1R3hLUkFqeVZraFhJc2dPamJh?=
 =?utf-8?B?NHE5VnJxMlp3c0RsQnRoTjFhdFRuRTFxZWhmWHdHUEtjemlHb1cyczVSeVdF?=
 =?utf-8?B?VDZPYTBnekk3N1VNUFFURnZaaHRaa1BrbWhMaDBqd2ZrZXFLUnlJQjJrSkZD?=
 =?utf-8?B?SlIrQkVwQUNkRFdibDlFV1ZwVE1XRkhMc0JIS01YcmF0RUFNR254dVl6YlRv?=
 =?utf-8?B?NENqb0FTcUtwSllpRSswN0VabnVqTGU0QVdUL2c4bytIYUZHdjFMNW1yNVBT?=
 =?utf-8?Q?GJ+/7tSVz6CGzeMSTvJtiMGqg+UaCgrL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZURrbExJdkN2ZGRNY2cyckFHWWFkQVpzVVFBS2tFMEEvOWZ2V0IwVWJEOWFJ?=
 =?utf-8?B?OS9NRWR5ajlkYndsdEl0eGgzNXVzZXREL2kyVno3cHlldjZ3cjNzekJnTkNx?=
 =?utf-8?B?RDE4L1VMNnhqV3VVdFFpR0wrbTI1dE9VRGpvNHdzNU9qTEdCZDJheXBqMTI5?=
 =?utf-8?B?b051VktMb1N3eXFIdDdzcUtnTlg1aVlYTEdiQmNhWFZvc2VHOUVCamlZYWZx?=
 =?utf-8?B?UThqRTFKTk12ZkhvNy9LbTVhbmFqd09DeDRKL1ZoRUlEUFZWTit6bk1leUpy?=
 =?utf-8?B?b2pWcnpOZ3NVeWpCV2xiSVhoTjc2eDA3WFpJNXpYc3lXM1E3elliblNLWTZa?=
 =?utf-8?B?eGZ6dHUzcHAvUlVQMlRCY2pCT3JXVVlsZGtrMThWT2V3TDYyVjU1bzFzNDRS?=
 =?utf-8?B?ZlU4cEdQMnFpVVgzbW9OT1cxcXI1TDJGdEtZRVcxTUpaN2cyWlFubXFXaVk5?=
 =?utf-8?B?YXRKaE0zNlFrcWZzYzZyTzREM2pJeWlPenYyYjNzaEhvS2VHRFdHYWZabmJ4?=
 =?utf-8?B?Z2hsdzVSY0RNL1JJOUh3Z2RDdjFBUTdXc3c1WlRlY2pUU0Z0cWR5dkRxa2h5?=
 =?utf-8?B?VjJNaWNLbDhSd3VybkxXV2xTeC93VW9QVzg2UEZUcGRYUVZ3YjIwdWhlQVN4?=
 =?utf-8?B?bmM4V3k3dWlxTk0vVC9Talh5UElCcWlwNTRLQjBIalV2WDdLTDV1TmZsYkVL?=
 =?utf-8?B?aVhiMmFUdXhlYTRNbGkwU1B6OXRjakNLUmRnZjI2MU1sU1VZbDloQUtKSVZH?=
 =?utf-8?B?cXI0b0FXa01KMGhKTlh2bXVSODRsNkhVWTlaaURvcHp5ZXUyaVJZcCtPSWdr?=
 =?utf-8?B?alc5VnVQMUxwVWU5UjJPV3lzQVZaME1JenY5MTFQOVpzOVdldUhPSDNxak10?=
 =?utf-8?B?NFhuZTVKcnRyM2xiMWsrRE5jR0VQRzdMeGplTmZYY3pWUDVoZEZWb2MzZW1K?=
 =?utf-8?B?YjBpYXpjeGhRTDZ4dlNmMDlKWjJjMWJLc1lueWwvcStHRWJobGtiTEpSMmdp?=
 =?utf-8?B?aXVZV0pzTGQrUWJySTZBbTlhalBEU1Q4NysvL2JNbXFOTFh2MzBjQUR4eUJT?=
 =?utf-8?B?QjVxQ3FaSlZuaUt1NTFFMXNuOS9qM0pzTHhlaDd6alJoUm9LbjZ5My9zL0h0?=
 =?utf-8?B?eVhLZHdYYTh2QkFrRjBnbzBTdEw0MytiZ2h0dCtBendZbjZmQ0Z5MDd4Zmk2?=
 =?utf-8?B?bmpKZ1FBOGF6ZmdJdVNwRlFtV3I1Zmx3SXBtc2lld0trTG1FS25PU05aS1BD?=
 =?utf-8?B?UHphU3E2M1VjeXBzK0JNQXpKV3RNYVJVWmo4dkVaRFYxVHU4RVFPTDN2NUJD?=
 =?utf-8?B?dXNOU0RkWnhOSm14UGlJNzYyN2RFU2Rtd1Nubm1ndVltL0w4cGVmUUtYaHdD?=
 =?utf-8?B?RFdvY3JLNDB5Uk96V1ZnNmtKWWUyNkhZOERJYkl2N1FqZ1pGcGpHeFQxTC9B?=
 =?utf-8?B?NHpjU2F1TGZjcGU4T0loc1JFMzBrT1FkRHFISThEQXA1OWM5c3hMOHdrbFpS?=
 =?utf-8?B?OG1obm5FdkQ3cFZmTlAyOWhWSEVFdlU3b1E1UjhYeTFFaWs2VVhIVHFNUUxB?=
 =?utf-8?B?M3hYY2lmMmpaeVdSV3BKKy9vMXg5cnpXMkd5R0tLRzlIcFpPR3ZFTHAvZzBv?=
 =?utf-8?B?K1FFZjlRcHhHMDcvMllTdmdFSGQxbWVQUnpkZXFwSlVlZllBZEFxTU0zQjc2?=
 =?utf-8?B?a2N5VVVPWExCUmRSNTZROXNjbVhQdklFcHZTUVRUMFpBQVM0SWRkbGN0djho?=
 =?utf-8?B?TnRRSFBtcWlabEF5dEtYM1dUOXIxMmt0aUdteXRoaTg4dGoxUWxuSjhXekZZ?=
 =?utf-8?B?b0NPeE9JYnYxRXhvQlVseEhYazNUMmEvNFFOVTM5dkdUcW1MZ0NudEE3WVlC?=
 =?utf-8?B?OXMwd1RBS3lRdCtmamhSZjluZ21LeWxISEV4ZnYrNE0reFh6U01OUEJZTk1v?=
 =?utf-8?B?c3V2U3Z4NGYrM3NpLytobkhRelp4d2JQTGVVT0R5OVlmWldPOTBMVEcrallt?=
 =?utf-8?B?d1RrOHZMUEQ2R3hZVnRXQUN0NW0wRitoWjBQdjZQeU9XSExrbXlPUUp4QnZL?=
 =?utf-8?B?ZkMyYkdOMDl3bkZUakVsNWljVlE3U2JieENyTkdidFN1c0I1Q3lCNHFWVHBG?=
 =?utf-8?B?NzVlVytFRS9ma1BUeUZMR2o1TFY3akdKaHhHdzd2d0NIcnl5SkNFV1Rma2o1?=
 =?utf-8?Q?SkIBSGfxhYRc5H+AdN27OCQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eac0ca2-d1e9-4639-1fcb-08de07bdfb19
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 05:29:27.7754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVXG9vpu5yzHUfskX7AjvYWFEEt2J+oIS5T+0Q7Mx1E6i/TUciZ0+Z00CwKDI/yE6rAgO0EkkHDP1X7cC+G3UyTiAC5HNKbvxhewMIGKb2bm99nayLYnqVccYg/KYt4O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7961
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

On 01.10.2025 00:47, Venkata Ramana Nayana wrote:
> MSI-X vector 0 interrupt routed through legacy port 190000 and driver
> must check legacy registers and clear otherwise it's block the next
> interrupts.
> 
> Signed-off-by: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
> ---

Can you add more details in the commit description to explain why the
guc2host_irq_handler was removed and how replacing it with
xe_irq_handler achieves clearing of the legacy port at 190000?

Also please list the Bspec number.

Regards,
Bala

>  drivers/gpu/drm/xe/xe_irq.c | 18 +-----------------
>  1 file changed, 1 insertion(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 870edaf69388..06976cc77918 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -847,22 +847,6 @@ static int xe_irq_msix_init(struct xe_device *xe)
>  	return 0;
>  }
>  
> -static irqreturn_t guc2host_irq_handler(int irq, void *arg)
> -{
> -	struct xe_device *xe = arg;
> -	struct xe_tile *tile;
> -	u8 id;
> -
> -	if (!atomic_read(&xe->irq.enabled))
> -		return IRQ_NONE;
> -
> -	for_each_tile(tile, xe, id)
> -		xe_guc_irq_handler(&tile->primary_gt->uc.guc,
> -				   GUC_INTR_GUC2HOST);
> -
> -	return IRQ_HANDLED;
> -}
> -
>  static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
>  {
>  	unsigned int tile_id, gt_id;
> @@ -979,7 +963,7 @@ int xe_irq_msix_request_irqs(struct xe_device *xe)
>  	u16 msix;
>  
>  	msix = GUC2HOST_MSIX;
> -	err = xe_irq_msix_request_irq(xe, guc2host_irq_handler, xe,
> +	err = xe_irq_msix_request_irq(xe, xe_irq_handler(xe), xe,
>  				      DRIVER_NAME "-guc2host", false, &msix);
>  	if (err)
>  		return err;
