Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F03CCFD2F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 05:03:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2804110E51E;
	Tue,  2 Dec 2025 05:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8jQZAC7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A649310E51E
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 05:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764651821; x=1796187821;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6cvEkaS5P3FvYG7lFtdubWK682HHkjHZLJLYYAsaed4=;
 b=B8jQZAC7cI/a45QOHrw1SUK6nt31ggqLHbr+iGR5CNa13z29ToRx84HQ
 O1iDpLfRILwDmf2xw9Q5krQAJBiEdH8D/LspyJT9GEYgsAYmrBiAut6Ib
 BgHsaHG3lEctLwOwu//N9oi0FeY1giBlMbozqZWUaNJ4FRngzWa9A/yqB
 hYwCZHXNLBESgqWRW+A9stHf/rYrlu10evfgZhIaBaittfs3fzwtcafrd
 gaID5pWjXoCHQW9Qb3ZlpjGeNu6+p6SQ7VZw2TlkTdEksRnkJjh3FSsEg
 DZx7mZ+tiGM1hbiZJo4cpmPdx5AatD/rWgLPEb0v23OwzgMo71vRA3dgg w==;
X-CSE-ConnectionGUID: zKY3BeGdSzakXr1Hq8DniA==
X-CSE-MsgGUID: WWdctkSyR+O8uDURBiaG7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70467017"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="70467017"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 21:03:40 -0800
X-CSE-ConnectionGUID: r/0XMufeTHKoVLg1Ev+1Mw==
X-CSE-MsgGUID: +13miG20T9KscyiqAG8a9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="199211432"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 21:03:40 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 21:03:39 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 21:03:39 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 21:03:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LI+luxXB5HQBXo+/B0FsNUgzRtFJVKc1rZ7cKIZ6faSERqkocry7UPZHHmFcAf+9KLLai5EvU74FgKIorX6A8Opq36an+5FNCZAKLkfC14Hnl4rU7BwA44EFg+lfTF2TovbhqvEra/xef7w1nwb2ume1epqVTrBaPdrQiOUytTc9fDzbWbWVh2gOxgUkxfr3BUnGmZM1EUrGKn/5K7XUWxf7YxigHldBbxn+B7QLPz3ZXK5bAJYr7YSiZJcsVCXlFAw4M/eIHCtNDcDJ8G0E+3N6pGQqXbi0JnTLkZIyXV3cQG3B3hxx/JOlnX8xhRk1NTcAQSaI0gp0k40KYd4j2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzPTpguGHafA2aQWBuu7xo2FAL8x6s6Y0ZSYlIrFOrc=;
 b=GWadtuD8c38bxnJWj1u+ehcrzlsmKk7qJuDhBySL89fATVIumi8a2u2bsH+raG9CMkPHCNFLcQTluHC9q6xlrtuYEMjR/kZN83TuvjLcWVW561xdobg7sFMov86A/5e0osGshRg9tVqYv+X9Ms2cxhPbkCQTWDYQAedp+QQqJCsmYKZAuosQUt70ABMETJ3hKxulZGt0pDElINTNmWVcpThgCe69TJIjd6OTRhwVwuYIS7sgBzQ2AtNS6/du/7KW5UuSE5SOthWsXrcbVWPtwRyCUc5NaefgLH8/MgB2cmcq5bGIe56P2y/AQuP6Zr0xh7T2+2huVwacTzZnf2v5+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by MW4PR11MB6861.namprd11.prod.outlook.com (2603:10b6:303:213::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 05:03:36 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef%3]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 05:03:36 +0000
Message-ID: <b4ac66ba-850d-4140-bfef-f91399e0540f@intel.com>
Date: Tue, 2 Dec 2025 10:33:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/xe/soc_remapper: Use SoC remapper herlper from
 VSEC code
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>
References: <20251117205315.1458477-6-umesh.nerlige.ramappa@intel.com>
 <20251117205315.1458477-8-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251117205315.1458477-8-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::19) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|MW4PR11MB6861:EE_
X-MS-Office365-Filtering-Correlation-Id: a61f1e94-8156-4f69-9fab-08de31602607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVk1SlF4MlgyeXpVYUF3UG1zNDBKNXM5YzhiRVRFbE13NG5NTkt2cjBxb0NQ?=
 =?utf-8?B?S0dUcVlYZXY4MDNXMUtuWExVVVRmV0dTWUZadXc3RFRFemJmaEE0cU80R2ll?=
 =?utf-8?B?anJVZlZ1UXFERmZRSjFRUkxkajVXSUxuSkxLbWhmelFaNytmQkVWT0JyeWJq?=
 =?utf-8?B?UjZHbDVyZ2t2YmwxQ3krcmR5S2NuMzVoa2M1MVFOTUZzTXBzTFdDSHJORjJP?=
 =?utf-8?B?bFhIQ3FFclBRSTltNHZXMTEyL0dacEhNaHNrMTRYbENUN3RDOFROelFEVysv?=
 =?utf-8?B?c1hJVWNlODZiUFc4SzhvZFVKNC8rTjV5RGRSeFdDMG85RUZ4ZnFTMVgyeU1O?=
 =?utf-8?B?cDVxd0JrM21PSmc1Y3ZsNlN2MUlhc3o4WUpRV1dpZE1QZ2dDTklweDh6YlU3?=
 =?utf-8?B?bEtvWkZ0aENkdjJiYVVXUjA1NHNRS3NIdlZ0d3J6TkxyWnhMZGxDQUE3by9V?=
 =?utf-8?B?eTVKVXhabEI2dE1CdkJ3VHM2cXFNK0JmUUZIUVFxWjhhM3BCYlNHWkp2ZE1m?=
 =?utf-8?B?QnpzaDhCYUFrM2laT2ZrQXh3akFNZUQ0WFFMTE05UTN0ZjlvT3R0eGRGcVZO?=
 =?utf-8?B?aXlpWHdIYW1CekgwMU9VM3VzcDlwYlJzZWlLc2FtbFBlUS9YYnNMZGJwTm1F?=
 =?utf-8?B?dFpHQmJXSC9vR2JJSFdIUnNyOGU1NHhwQjhVbHZRYTF5SjJqUi82VEUxUk5l?=
 =?utf-8?B?YjJrSUVBMG9HT2x5Z2VLUHJzL1RGZkRDNkk5RjBPLzZoRVFCWU1PTE5TTEEx?=
 =?utf-8?B?ZCthcE0vNEtNR2JscDdaOER4Snhvd2V6OVhQekZSQVowbGpsa0dTRFQ1RmhP?=
 =?utf-8?B?eWxrMFdITEQrOGUzOCtpaTdKY1ErVnRTUk5TZEdNeFUyVXpoN0dhOUwyNEZL?=
 =?utf-8?B?a2xiNGVDckFuKzR2NHlPb2RrQUpYTk1vRzF1SDROeU1jSGhYckRFREF4Y0t2?=
 =?utf-8?B?Y0plbUp0b3B2T1o2UEVWanJsZ0tjUkhUTkl0WWxScVJyb2taMlRhNURkdUZq?=
 =?utf-8?B?VndWOHJKWmhWVS9CREN0QUMwbHIxN3QraE9QampNM293ZkJiRzJPTGJwMUFj?=
 =?utf-8?B?QktiNFVLeHFZTDAvOWNVekl1RE5kTHk2MlVYcWppWlYya3hpM01vbVRDaUJk?=
 =?utf-8?B?YUJMdmhKNG1kZnRhNUJFMjJNREJpM1d4RjZBdVBPMnIrd3U2YXlXdUkwNTE0?=
 =?utf-8?B?azJSY1pSVzEvSyt3ZTAzWjJiUlZJY1ErcUIyQk10TUV3NVJzbURlQk91NFgr?=
 =?utf-8?B?YXRpTUd2TjZiQ083cTh1YjMrRjVRQXl2K2RpbTFXdkg5UExNLzlhcEY5Q2Y1?=
 =?utf-8?B?dUdCZXVJZ2gzVm5mUkloY3BMeHR2eUk3R1l1RFpCY24reGNGbk56S3J2MVJz?=
 =?utf-8?B?SnZqSitrbDhvU1ZuWm1pWEtoWXRwWUJhL0dyc2Fmd1pTaWFJVFM3MnBlTENT?=
 =?utf-8?B?Mk9McjVPRmhrM3FGNCs0NEF3TzU3WnpSeW1ONCsrcmd1c3hNUy9aSGNLdmZo?=
 =?utf-8?B?ZHpBc1J3RnJVOU9pdmJrSHY0d0p6V28vWWxUTDlkaXpNOXRPRmZpUXBsbFpo?=
 =?utf-8?B?S0dEaDB6dTAwemJKTEZxbjZJOEZNQnd4b2c3UndkWEhIOHFnd3J0M0NlY20x?=
 =?utf-8?B?RFkzMVhvYU5OY3lRRzR4OERaVUFCTENGV1R5djg1VTJZN2EzOFBOQUkwUjUv?=
 =?utf-8?B?MDQxS2FaZjQxbzRCVU93SGxzaitIVm9RcVlaV3pvckl0K1dJUTJDNkt2Nmtn?=
 =?utf-8?B?NFlBSWs4SG5rLy9QeUdLUXZINFFHdFNScEhySE5acTlhc1pvZUcrUzVNY1A0?=
 =?utf-8?B?VFg5T1pxVG5Zd01GTWlNdW5sZjgrMHFQY3pJcExWZi9yM1FGaVljajM1VDVD?=
 =?utf-8?B?SHJHcFZ5b2prT0RIMFhlNEVPcGxIbE9DREtsdFJiUFBKSU81Nmw3enZSN3hI?=
 =?utf-8?Q?2OOXbLb51/N5HmMCUp3kOVUmDjtMXT2U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5536.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVZ5d0hkcG8vMkMzSDNDNHhIMFBTejl6VGhvYkgrcHljbFIxYXJsRXlJWm0w?=
 =?utf-8?B?MjhWUXpRUEY0RlFON2o4amdMc2FyQ2JMNGNCdi9ZMnZnczZZL2NRbldKVlpw?=
 =?utf-8?B?U2ppSHEvaS9zeWo4YnpmcTl3V2E4MTI0dEFLNmlFVkdFSW9ITnhzQXNub2E4?=
 =?utf-8?B?TE1vTVlGc2Y3V1U4V2ZVTE9kUDY1TVdGdUFYVDI4ZHJWYnFMMURqQkdueWZw?=
 =?utf-8?B?aUhkTkNxYmJZd1BaaE91aXluamJaS2ExK2FYbmJHRHB2L0tVdEFBdDRFeUJ6?=
 =?utf-8?B?MzNxdmg3Q0tCc3FteGcyS01LcHE3SHdVZlNNTHZyeFd5VC90MnZUUHUxVVhF?=
 =?utf-8?B?K1RjbVNQTUlmMXRYcCs3ZDJCMmlJQzhNcXZtNXRzYVZWN2g3OFQ0NDhjUGln?=
 =?utf-8?B?WVRleE1NLytJK0dNZko1K2JHRGJHcFhaZnB0QnNLd3dsUjJxVFppZ2c1TGJk?=
 =?utf-8?B?d05VeHhBOTFtMUdwZUFpdkxNRnRQdXhpUk4xbEp4dWVTNy9DRThrbGRIcVpz?=
 =?utf-8?B?dnlzZjRBL0RXVGVZWERkSzVvdzN6VTFHd2pLZ0tjSS9GMkE0ZVZGOEo1cTFt?=
 =?utf-8?B?cklZZS9jLyswTWgrMGNXZ2RrbldIMzVkU0JvUFFsa05xRUFWdk4xQU02Qk5R?=
 =?utf-8?B?aWNYeGNjS3dzK1htUHpOZzNPOTF0cDA4S3NLenVCZDMzRTV1ZmlZSHBTK1hI?=
 =?utf-8?B?UjFRVExRSnpnSi80U0pyM3BwZnNhNmluMmVrT3U0cWUrcGhRNmtqRk5xcmln?=
 =?utf-8?B?Z2xZU0pYQm54dmpJZ1VVQThUZHJoNjhLWGRuRjlOYkdUTk5SQWNJd0NqUGZk?=
 =?utf-8?B?RlZwWmw3azVrbm5FVXU3bjdhbkN5eFdFN3FmRURqWnMxK3NRUFJGb3A5Rkwr?=
 =?utf-8?B?TFlOWS9EMGdHVUdwMlhqblNVLzdjc1lwdTBUb3J5c1FMbFdjeFpTNTMwUnlY?=
 =?utf-8?B?aHZubkx6SHhVaU9ramRGdU96VFhiZGFqYUtGa0tOelMrd1J0YzYyTWIxa1hX?=
 =?utf-8?B?U1NHUXE0QW1FYzZRQjJCdldqbjhtd2RGUkh2R05Ddjk2Vml6Q2gvcW9KZk5r?=
 =?utf-8?B?M2NVYjFaMCtpeWtvc3grcTVxRUdvSUg4Zjl5Rkd3YWwwbHR2SGpHdkdOdkha?=
 =?utf-8?B?eWN6YlN3L2ZUV1p2Y3dVZnVXVWczYVpUZ2FjRElHSkRPMEF4VFZ1aGZaSllP?=
 =?utf-8?B?bVZYUUJEckdNQ3pUQVJtR3oxb253S1FNRjJIRzdsK3hBVmliM1djQXlIbFdz?=
 =?utf-8?B?VTUya3hwMUJsNXBsSjM2ck5nRVk2c0hiVi9HTTBVWU5SU096Z1BNdEtNaDhV?=
 =?utf-8?B?blRlenN2TGVYWGh6N1ltRCtNODVqb08ybjE4Z0VBNk0wTlVkdVhISFJGa0lC?=
 =?utf-8?B?amRaaVBPQVVXK1crbjJqN0IwRGZhT3JiblFIbXZLRStpdjNsS0gzejhXeEdG?=
 =?utf-8?B?VW4rVXFYVHQ1MUYxNXF5TXBRU2JrZ1hQL2tTbkxJeXNUdEpZVGxLNHFzTnpj?=
 =?utf-8?B?TnBrTVRnRllNdXZsTXVEdXVqdmU0clJFbFZmNkUrcEdXdlZWWVZ6YlIxZmZG?=
 =?utf-8?B?T2hvKzU5NWkrKzdyNTZtSGdvWFdOeUlyaHU0SC9QOC94bUYra2N1NVVxMW5u?=
 =?utf-8?B?ZHhndjAxam1pMFltMnQydUVFYWM5RDkvb3gxSmJ4b0NHY3orNWIvdjZ4UWFx?=
 =?utf-8?B?SjFGVTVhNHJpeHdUMU1weUNFbG54S1ZCV2lKTUtrQnlqUmdld3NiLy9yUXd6?=
 =?utf-8?B?UWFMNXBEc0Rya0dyNTU4dkVsOTZJVGYxVWNrU0VEVjl4eG1wUWJSb0wwR2ZB?=
 =?utf-8?B?eGMrVFZEQjZIR0JkQTdNUmt0S0tZRFo0SDQ3U0xOdGk4d2VkdEVmVTYwZThN?=
 =?utf-8?B?YUYvZVhwL0JpaGNXWFphdXNjV1p1ckRtQTljTTdGNi9EZkIwa0ZmUXlWWjU5?=
 =?utf-8?B?Y0Z0VjU2YXNmS1FDYm9ZZXUwbkRyZnBCODFxaHp6YjVWZVJrWTdadjllcmN2?=
 =?utf-8?B?RzlOK2pTTTUydUdKakFCTTE2M1hDUW52SHVYSnUyajFYcWtTYzIwdXFDc2FR?=
 =?utf-8?B?cHkvQi9XSlZ4bkNvZk1ERDA3eWI0Z3k0eWNLQUNTMlZFRG1lTU9HNHk2c3py?=
 =?utf-8?B?OThhQktpdG8wNnJiMGkvRk1ZL3NrUlJZWnRGd2dITms2N0g2bXlYSVd1NnE4?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a61f1e94-8156-4f69-9fab-08de31602607
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 05:03:36.2380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: srog5y79MYEU5gJvD0VLzBP4qIGD/eMvANTM658LPYREyP6D/FglD2tuaWvjkRLyYnqFiXaef6yqX66AcMoofA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6861
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


On 18-11-2025 02:23, Umesh Nerlige Ramappa wrote:
> Since different drivers can use SoC remapper, modify VSEC code to
> access SoC remapper via a helper that would synchronize such accesses.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
> v2: (Lucas)
> - retain comment
> - s/BITS/MASK/
> ---
>   drivers/gpu/drm/xe/regs/xe_pmt.h               |  3 ---
>   drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h | 13 +++++++++++++
>   drivers/gpu/drm/xe/xe_soc_remapper.c           | 18 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_soc_remapper.h           |  1 +
>   drivers/gpu/drm/xe/xe_vsec.c                   |  4 ++--
>   5 files changed, 34 insertions(+), 5 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index 0f79c0714454..240d57993ea6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -18,9 +18,6 @@
>   #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
>   #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
>   
> -#define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
> -#define   SG_REMAP_BITS			REG_GENMASK(31, 24)
> -
>   #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
>   #define BMG_G2_RESIDENCY_OFFSET		(0x530)
>   #define BMG_G6_RESIDENCY_OFFSET		(0x538)
> diff --git a/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
> new file mode 100644
> index 000000000000..9edf234227a9
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#ifndef _XE_SOC_REMAPPER_REGS_H_
> +#define _XE_SOC_REMAPPER_REGS_H_
> +
> +#include "xe_regs.h"
> +
> +#define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
> +#define   SG_REMAP_TELEM_MASK		REG_GENMASK(31, 24)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.c b/drivers/gpu/drm/xe/xe_soc_remapper.c
> index f5a02abd6ab1..85d37a86117a 100644
> --- a/drivers/gpu/drm/xe/xe_soc_remapper.c
> +++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
> @@ -5,8 +5,26 @@
>   
>   #include <linux/spinlock.h>
>   
> +#include "regs/xe_soc_remapper_regs.h"
> +#include "xe_mmio.h"
>   #include "xe_soc_remapper.h"
>   
> +static void xe_soc_remapper_set_region(struct xe_device *xe, struct xe_reg reg,
> +				       u32 mask, u32 val)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&xe->soc_remapper.lock, flags);
> +	xe_mmio_rmw32(xe_root_tile_mmio(xe), reg, mask, val);
> +	spin_unlock_irqrestore(&xe->soc_remapper.lock, flags);
> +}
> +
> +void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index)
> +{
> +	
I think need to check index is valid or not.
> xe_soc_remapper_set_region(xe, SG_REMAP_INDEX1, SG_REMAP_TELEM_MASK,
> +				   REG_FIELD_PREP(SG_REMAP_TELEM_MASK, index));
> +}

In next patch  we have created wrapper for SC.  Instead of introducing 
separate wrappers for each SoC remapper, could we maintain a single 
function, such as:

int xe_soc_remapper_set_region(struct xe_device *xe, enum 
soc_remapper_id id, u32 index)
{
     switch (id) {
         case TELEM:
                  if (xe->info.has_soc_remapper_telem)
                         return -ENOTSUPP;
             // Validate index
             reg = SG_REMAP_INDEX1;
             // Calculate mask, val
             break;

         case SC:
              if (xe->info.has_soc_remapper_sc)
                 return -ENOTSUPP;
             // Validate index
             reg = SG_REMAP_INDEX1;
             // Calculate mask, val
             break;

         default:
             return -EINVAL;
     }

     spin_lock_irqsave(&xe->soc_remapper.lock, flags);
     xe_mmio_rmw32(xe_root_tile_mmio(xe), reg, mask, val);
     spin_unlock_irqrestore(&xe->soc_remapper.lock, flags);
     return 0;
}

Thanks,
Badal

> +
>   int xe_soc_remapper_init(struct xe_device *xe)
>   {
>   	spin_lock_init(&xe->soc_remapper.lock);
> diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.h b/drivers/gpu/drm/xe/xe_soc_remapper.h
> index 3cfd44f1fd74..75431b94e66a 100644
> --- a/drivers/gpu/drm/xe/xe_soc_remapper.h
> +++ b/drivers/gpu/drm/xe/xe_soc_remapper.h
> @@ -11,5 +11,6 @@
>   #include "xe_device_types.h"
>   
>   int xe_soc_remapper_init(struct xe_device *xe);
> +void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 8f23a27871b6..3e217fb75394 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -16,6 +16,7 @@
>   #include "xe_mmio.h"
>   #include "xe_platform_types.h"
>   #include "xe_pm.h"
> +#include "xe_soc_remapper.h"
>   #include "xe_vsec.h"
>   
>   #include "regs/xe_pmt.h"
> @@ -163,8 +164,7 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
>   		return -ENODATA;
>   
>   	/* set SoC re-mapper index register based on GUID memory region */
> -	xe_mmio_rmw32(xe_root_tile_mmio(xe), SG_REMAP_INDEX1, SG_REMAP_BITS,
> -		      REG_FIELD_PREP(SG_REMAP_BITS, mem_region));
> +	xe_soc_remapper_set_telem_region(xe, mem_region);
>   
>   	memcpy_fromio(data, telem_addr, count);
>   	xe_pm_runtime_put(xe);
