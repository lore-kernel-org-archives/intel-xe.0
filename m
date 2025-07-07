Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6210FC83F07
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 14:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250C710E4CD;
	Mon,  7 Jul 2025 14:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQv7c6KC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8785210E4C1
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 14:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751900255; x=1783436255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9643ykSLGE12Zf1/GT+f+aS1lVusz2BR0SlP59MpPLc=;
 b=gQv7c6KCfFSjDs/5tQJAyevD8OK0EYeAn3iYW8IgD3DjfeXPGDRmY56Z
 yWOQ3TbS2OnLurIIR45rznyxBD8ZMceriCAI/kSp7jnyjdIyWoaizuKgW
 8tTi1Fz/9wcQQYPBKbx6XM3lnSZjIAxlmPkYRKKVPuP8oH6vnyP9JX8QW
 ODQZ0Ptf1i5dcWQ4/6OYJqfu9LNuOvJtLN+FrkIyb0mKW/eFRhXAph2GK
 oLjjoewp/ndi2C46UUwua8RJG/CtDgzlXKUNTEvFDej4ppbF8cYwV3/Kz
 x1ed1t7CLBJln8PwDOIWsc07bSUlhdh0aQNlwpPK4DLXdfTo8Ke8GpyJx w==;
X-CSE-ConnectionGUID: bhGumDp7T86Nm/zZQdVefg==
X-CSE-MsgGUID: aANIZ/PZQnyJcZdn1W6Oog==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="41747058"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="41747058"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 07:57:35 -0700
X-CSE-ConnectionGUID: COqaO+9WRW2i8qOHuw8YTQ==
X-CSE-MsgGUID: ZqJ0QLEQS+KGIhimMRwJUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="159776028"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 07:57:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 07:57:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 07:57:35 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.48)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 07:57:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9bnbD1N0P8hCsj8WW5OT7a4KFF3FDzcGW7mAko1jUeAZioICU0ebAiCOMTuBGyJtu8srCqEf6ECQ7YawnsBOYGgBrRuT1ouvzSRRvRZIqMcQp+u0oH03LgYqoiBjr1JfuagROPjax7ImVVcnce3nv22w6WFUXLEcpvTUn7qoPjNeN3+dkNSpQR2JZ+akAkTa7iV1WJM5dd2La070qmkb+nFU5aQgl1Fh77AsrC4V2ARua7VABrw88oU+DFppNFVnXf/ok43FMnsW/6/QC/fUPMLyTaMIJrJqyrqhAN0QG9sdoozzv1I/VWJJcagGab+jqeAGDu0Z47a/Ehf6ksrZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H72x7or7vJTGrlet3k1tqZVlMUQH4pDLakagby1jQV4=;
 b=NeZPQYARRnXvxtJqVvZabxub7wyr0AGxq1kmfMYW1mnAZvxMuDtWUpXRssDOmBY6yWurtjqz02NCyVkpxnSEbLlAMWdl60f1aTwZT+t4HuEb/jYkoKPfIlOqT4IOdaWwXL39oiwRhzAubZWrfiCNqyb35xb9ipTO+mJMw55IsJHjMuNPHLuIrMdBYyyzDGsEGc+3gDGjfegwwXB8+YMZfJHVDujBorPAislQFuJERzXYC1xX7WK3if3FXV8PaGKuJkGasDWCijBJG/+f4H0D5xjferAhmWxYKJ/Ls4Y6SfdcjQIWBdC4endApVQ4h/CXA4bKdx1BoZucqKwT3hHfaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SN7PR11MB7417.namprd11.prod.outlook.com (2603:10b6:806:345::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Mon, 7 Jul
 2025 14:56:19 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Mon, 7 Jul 2025
 14:56:19 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v9 1/4] drm/xe: Use devm_ioremap_wc for VRAM mapping and drop
 manual unmap
Date: Mon, 7 Jul 2025 16:56:06 +0200
Message-ID: <20250707145609.3857467-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707145609.3857467-1-piotr.piorkowski@intel.com>
References: <20250707145609.3857467-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0048.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::10) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SN7PR11MB7417:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d12829-78cc-4714-2007-08ddbd666e31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjlnN3FpY0dzT3VtM3RvRHlUaU5IZ0p4dzlnNkszYVYrSXZlRG5nSzJVV0xh?=
 =?utf-8?B?ZC8wVEhXOGluRVpFaXFOaW9Ta3pxR0p2aHZpa1BiSDlsK0VwUEZScE55QXBL?=
 =?utf-8?B?OU53RWVoKzB1M2ZrZERoSG1mNUlPUnhOeGkzVm9tTHdZM3kvMnliTTJ3Mmxa?=
 =?utf-8?B?WU1GQ1RKZ3U2VHAwa1k0WGpNZ2FBSlM1VlR5VjVNYWxid1FEandWR1BUK2FT?=
 =?utf-8?B?NlNHV1FNOXRIbktkZU5zdHlpK25aRkNybkdnRWtxeGQzdTRvL3FpMUR4WkdO?=
 =?utf-8?B?dEltVktRTm1sazNrU0VnZ1VCd1owTEdxekFqQ0h2ZmU5WnBLeG16MnFlTWVQ?=
 =?utf-8?B?M0sxaVZ5N2FxSGhuRXhPYlZ0cGVpeHlUb3FtdjVMWHdaTmJJM3BybDVZd0dF?=
 =?utf-8?B?MllZU29hY29KNlJ2MUNlUnltZm8yc3hwSDBCa3Uwc3QxYTUwa3N2eHVRY3Ru?=
 =?utf-8?B?YVViL2tKK094VTNCTTBGQzJzV1RFeGQyV1BYTzVVc1Z4b1JZWXFJVHZ1VlBK?=
 =?utf-8?B?UTdhU3FFTUlhMGE5TUJLYjZqdDkwSDNtdFFvVVhCWHRDcmF2SENlQ3JHNkdu?=
 =?utf-8?B?UmthaWdRZDQ0QzhhTUp6U2FLbDRtbzdhVEhPejl3Nm5aeVpKSnN5Rk1WUTRU?=
 =?utf-8?B?TmZCSVNPaWJxN3JVeHB1azNRY3UzaTdFS09kZzFuU0cvTFNEQitzSUc5SWdH?=
 =?utf-8?B?MmU0UjhkQ0ZFdnFYTnAxbVFzSVU0V3pxZmdxU2pJaUhKajlIUmNjRmFxakNC?=
 =?utf-8?B?aXdyQTdwcUUxb1M0TlFLNk1DVnhMZnBsWjNYa0p2TDN4cExoUHVtRE1OOHQy?=
 =?utf-8?B?ZWExWlFLR2JKaVc0WTFKMHlSa0w5VTN5czN5aXQ5QjNlZ1cwenZqNDEzUSsz?=
 =?utf-8?B?VUhTV2NFR1prQytXckw2Nm0relh4MWJ6OHVUaG5ITWo5VUVPWE80TXkwK1E2?=
 =?utf-8?B?NUkvYjdCUUZPUHd2OW9WTWk3cDZpSHZERHFCRHJTTEZTNk5XSFMzeWt1dERW?=
 =?utf-8?B?MEtWcWR0UGg2MTcvT01jT25ZckJLVWpjaGN0aWJWU2VhRDVaSHZRUzFWU0po?=
 =?utf-8?B?eTluUUxGbkF6VCt0U0VyU01tNFEwdnlrRmEyM2ZTZUR5VDdzYmtjUTBab0tw?=
 =?utf-8?B?N1ZIbTNxMmpwWjRPTk1GVTB5Q1d6b3VZRXZZRHhUUDMwdjl2ZkZIWFFLNzVG?=
 =?utf-8?B?dmFVUUpDV25DNm5nNkhmMldrOUdNWkprSTZOZEtxajM3TEFIdFVGeTZOUzhs?=
 =?utf-8?B?UFJWR0FESWhUZHg4ZFg5Y1JQbHhuL3J6djVCY01RUTMrYXlZQW53elZmU04v?=
 =?utf-8?B?UzZCM2toeklmWVdZTkQ1U3V4Z1R4UzBieGtuSWVTb2NDRjNMUUFtNlV3WVJX?=
 =?utf-8?B?Z1M0eDdmWWQzdXNyS1h1RUpDUnorVGRucUdHYXVHTXlXek1SYjRMTWd6alUw?=
 =?utf-8?B?bVZjNVRSMnhFb0o1WFBodUN2bTd0c1dNeXE0ZkR4dUZZVEJZWVREaWs5RDcy?=
 =?utf-8?B?Qm0wM0JKMko3UXJmKzc4RkN6anlNOSsyVEZYMVB0bDFDYUlnK1NRQjFMU3VY?=
 =?utf-8?B?ai9IN2xQdy9WTWJ0RnhpbU1ZR29xV3RBUmVpVGpsejcwUks5WUJrZXFhSUoz?=
 =?utf-8?B?UWlNMC85d2pUQzdBOFlid3VqUXA2ZHdMWGlac0pZWHV1SUNvYzdzNDBEQWM2?=
 =?utf-8?B?eWpSaUcvSFJWQkVJdUhqUTlMOWJZakxnUXZWb2w1ZlFmMmhjRjhzRFltaEh4?=
 =?utf-8?B?U1ozS3FuVTFtMENTY3dIL2J6b1graUN3bFRWanZWaE4rKzMrR2ZLVUVGOE9v?=
 =?utf-8?B?dWhpWmVzWWx5NHVLaHYzL0JHZ21SdU9Ub1lLOHE3YzY2WHBuNXhxWXlzMTNV?=
 =?utf-8?B?SlVIN2x4WktmUitYYWNDeGNINExBWGpoUk9GVTRRckg0Y2JWZTVaNExIMGMr?=
 =?utf-8?Q?1H7QuiuFCEo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDM2SkNlZXFGa2ZGckwyaE1vMFF4TEk5YUVqV3BEZFMwQXliN2d3eUNrSFlq?=
 =?utf-8?B?VU5mNjhjNVc0QjFPekZuejFwWjlTNWwyUVdvNlFFN3RMZHVDd3dJYi8xNWVh?=
 =?utf-8?B?YmgvSXpZWmRhYTE4RHJ5bllIdWpsMXM2dWFlNDdTbDZIcHpFejdnVWhUR0xk?=
 =?utf-8?B?SXltS3ZFQ1dTcEFPS2w2MHU1VGExRUxtS3htd3N1dC9wSStscEdGRjVUaUpT?=
 =?utf-8?B?Y2xFbVR6WE5xbEpuOUNZdHhqbUIwMkNSUDV4Zk4rOXdKQzJEOXl4MHBHV2RM?=
 =?utf-8?B?NitLN3pGN3ViVjFXMWQyN0RJTmRvbWY3L0EyUFFXVVY5UXlwZmY1dEt6VWcy?=
 =?utf-8?B?b1FoQnEzNGVYVTc0U2hMN3JPMFRYOThHcmxmSEtpY2UyWFZDcElzZWlqaHBk?=
 =?utf-8?B?Vm9EOEp6NWI3RnBZZy9kbENLdGIreVdFcU1xNU1Ba1NodElDRnJ5eTlNR1dG?=
 =?utf-8?B?M1o2dmtZdG1VWUw4S3JZUU5QS3NZb1JLbWhYMXdCNzc2ck4rM0Q4Zm93WE92?=
 =?utf-8?B?ZnR5VzZ0cG9xT0FubXcvenM3L1oyRE9Jelc4U3RUYmtaNjRCbUVhOTNDYUow?=
 =?utf-8?B?UVBlTnpwdUxXU3FFUGZYRThNL3BwbkRqTzFaVWNZU3FIaWlET3hWY1RPQXFi?=
 =?utf-8?B?K0NPWVFNemZDWWQ1bjhYR3hlK0JVSlVLUUNHVHZxSzFaTnl4TnQzOUZPc0JJ?=
 =?utf-8?B?a2VYMFpURGZqV0JvL2VLQmZwN1IzWFRzT0h3Q3RhVnlmMkZ1QnRQSEpWRTd6?=
 =?utf-8?B?V0pwVVJRQ3ZVU2E5Z0gwczNLeWI4Ym1iMkZMbU1PRkQxZkZkRTdpOW1NOWNK?=
 =?utf-8?B?L2dxQkl1b1NYWnlpbzhoOHUrOGt6R0pERVE0eGpjTzBEcitwbjNBNTIrbUVs?=
 =?utf-8?B?WFczcVhaNVZ6T2syU0hKd1RLR0wzcjBSeVpPOGI0MUpSODV5K1J6S21mM1E5?=
 =?utf-8?B?N2pSbW1EbTYreHRVWWZOeFFTWXBOK1VCRmNrVGdNczBXYm1ZYUV5Z081N3NY?=
 =?utf-8?B?M0dXTDJxZGhFSWtDRmtuREsrNWp3aEtVVG0xY1ZaMnZWdjUrNE9Ucy9jdm1Q?=
 =?utf-8?B?QVZJZDM0SEZ1WXJIenY0blBuYVVYM3BaSkNQUDRGV1VvelN0ajRMeThRR1Av?=
 =?utf-8?B?bzFET29JdHRtVW44VzBwSTl1Z0REc3RvMkxlRUN3bFRFV0x6UUwzTzVHQ281?=
 =?utf-8?B?S3NBNUVaTUpZaTcwU2hEb0taaFYvaExsSlk0dloyZXhmekVYTEM2TzR1dktW?=
 =?utf-8?B?ZGtwS3VReWZ0WmlkdUNaRUdvMmhRUC83MmYyVGMxa2VSMjVpUHNOT3RqanJG?=
 =?utf-8?B?eGFpbnZDS0llNmlmVnJ5UlQySVN0eUtibElLcWNzMWVMMHF1dExSMGt4WlNE?=
 =?utf-8?B?Nm1MaFVoOFc2ZlV1Tk4wY3B1QWNwN1BwTDFFcHFYNEVaMEdxbDVJUldPbmJv?=
 =?utf-8?B?eUY3dnlxQ1p0UlBZUnBpckNpM3VLa0M1Nmpic2E2Ri96MlROV2VDY0QwWmVa?=
 =?utf-8?B?UFc4V1Y5TjhRWW55eGcvczlJRHRYN0FVNVhtNVBHL2FvWlU3R04vRWtxbVBw?=
 =?utf-8?B?SmVmZHlzNVBxTWlrV0prT0lmZG50QjdHcnI0QzBuNWFSR1lEUWhtUEE2M2RS?=
 =?utf-8?B?THQ2NEdDLzZ6ek1nMWFtL0x2REtFNFZURWEzK0NDcVRoUm8xL2lGV0FVSE9V?=
 =?utf-8?B?NkNWQkJyeEZVTlBqRG80cTFjZXNPd1JHQmFHc0J1R2wrbTd3V0xnSEcxcEtK?=
 =?utf-8?B?OVN0bTZxRzZtNmdwbHI2NGVjTElEU3ZHcXRWUUVHSVE4M3lwdk9vS0tpa0lH?=
 =?utf-8?B?Qm1jNExLbVZVbnBGNWN0Z3UwZUJ2Rk5IYjBZVTFNYzBRTTIydnJabytmUUh2?=
 =?utf-8?B?dDhOUUJyWExaVFdadkZhajZtVFFRYnlMK0l4Q2tVdHR3T2lEbjBqRDBtYUsx?=
 =?utf-8?B?N3ovRURWZVNGSXltb1JXNVVNRzVwUVdyTFU5dnFaWXRpQXh3bHBlUXI5eXNB?=
 =?utf-8?B?eVMzR0JPaWRCdTF0dE1HcnZhVnJyVk1ad2Q1Ri9qZzYrNjF3WXArdWZEZXJH?=
 =?utf-8?B?L2p6OXpWdm9ra2N6QXl1bHNWR3dmZUJkWFAvSDJ6dzUxeHZRYmJpUUtlTnZV?=
 =?utf-8?B?UnFwQ3hrK1NURGVaZ1Q3OUUwTkVYc0RPamJGRjdwYnBvMVR3TXJMRDFnbDc2?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d12829-78cc-4714-2007-08ddbd666e31
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 14:56:19.0961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ep3wqn+uqE/xnD7HWVFguDcvEP4YVCHO65LV5sNPQ005OtzCPq3q1/8xFrIPQ+Y8zAds8DpWSPzW4gORhP+j/3sWwWTKayWGaF37dkcanXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7417
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

Let's replace the manual call to ioremap_wc function with devm_ioremap_wc
function, ensuring that VRAM mappings are automatically released when
the driver is detached.
Since devm_ioremap_wc registers the mapping with the device's managed
resources, the explicit iounmap call in vram_fini is no longer needed,
so let's remove it.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index e421a74fb87c..3a4c84e9efc6 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -156,7 +156,8 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 	xe->mem.vram.dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
+	xe->mem.vram.mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram.io_start,
+					       xe->mem.vram.io_size);
 
 	return 0;
 }
@@ -278,9 +279,6 @@ static void vram_fini(void *arg)
 	struct xe_tile *tile;
 	int id;
 
-	if (xe->mem.vram.mapping)
-		iounmap(xe->mem.vram.mapping);
-
 	xe->mem.vram.mapping = NULL;
 
 	for_each_tile(tile, xe, id)
-- 
2.34.1

