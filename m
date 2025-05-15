Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D36C2D0CD
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 11:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B777110E002;
	Thu, 15 May 2025 11:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jeKrlYe3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A9510E002
 for <intel-xe@lists.freedesktop.org>; Thu, 15 May 2025 11:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747307089; x=1778843089;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KAax2p/RVj1JAO04uD7Zu1G1Jiy8ZlTeZXBDoL4OKhI=;
 b=jeKrlYe3+u0xO4KzsZKJ4b9+dWsFv2m6VMFI/mJDpLJEPWB1GIrY4QE3
 ViBU5wSWIRBWeq5gMpf2Z9BOXcgyYmo0LftmcxY7f8zJPeFWtVxeepiNE
 D1XEpyWPUp2+WYoxU/Xh6bkFobhLNMMQSVwrslAjxpGFm66brxVceor6G
 1Zax/zbRVfwXH45aLRHoQVApUSD/IYP/dnItJ28vayvlOodiM5PAco9iZ
 uvcco9XzVv/9OMMlhlvPyQ1yVUQ+5La3p4kpK8dszsMHJ31v++RI1UvfW
 W8BaHylf8NSx40lbAHoflT65oaOHW+njiPXWIwRf0wLfD9qK3Z7hAnd74 g==;
X-CSE-ConnectionGUID: ldviZj9JSSK6p9DsZo6aWw==
X-CSE-MsgGUID: yb+wbnwWQ+q8hfRgb0p8tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49349416"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="49349416"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 04:04:47 -0700
X-CSE-ConnectionGUID: buEARQKDSceg7ExjiMipJA==
X-CSE-MsgGUID: 5ptIKUPQS6aNAKdVJzAkgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="142343328"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 04:04:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 04:04:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 04:04:47 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 04:04:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8jDclRWMN4dBqNZrpLwmM1BrXw6n4yZP/w3caU5MFs5tQ7NUzyHt7H1Wg4diBA4vZaR6/DO7QZkYXt8/TSsHX/9rqK4obtItsKkKWAChXc3zvKUS+JcihC8xSse0DsFyXWczAsrFJZMWqt+nPNfi6yMp1Apqe4JAt9PG4jABt8khFNHf1tZfWu/vdmMwI4gk/lB9eC3tICATGTEaMcww+CAsk7XVEF3kuLPvdy/SPFFocGQWDYOYbMrd9EpFJp0TyjHwwEdXEEUmi591SkwFxSZ1njCEXGcTDzrdGT4jLkwU4QXSzp9dZO8nERtcFTkdrNK4kbFDmyEVw8M7A/tYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vld7FBZmYASWFMENBgoXWJYtpL6I8aPlOESHGgMoP40=;
 b=exQStU/ujRYtXtFwJE9KQaHEcD3Scq5OUBYKkLJV3/BfXxqKiNYAhz2p5zyO+FOIUPGTEenKO6ublUlf+O8OJwYgs9+YhqyMZ+hCZaPiopIvKbB9dtPfO4QIP7N2U9tjebySrrMuYuda29a59Ny+/UbTmWnubCPuay5yzDhXbN2jQGJ7OhlmXCGXo3Z7hHaMqQDrxU3c9Byiolau7sOg+cy4EdFz2ICXC3DUrI6EYTJmYNfXKk0WD6XEmfJancdN4h0g4BwzM9f2gbUDiAEsamRGVmyuzS1WNxF1jVEiGjXcjztORhgUplLG2amYQYNdhuNumusYmKZ13CA1qdXJMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by DS0PR11MB8072.namprd11.prod.outlook.com (2603:10b6:8:12f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 15 May
 2025 11:04:45 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%6]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 11:04:44 +0000
Message-ID: <ec40773f-f258-4e0a-9659-bc73adba05e8@intel.com>
Date: Thu, 15 May 2025 13:04:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/vf: Fail migration recovery if fixups needed
 but platform not supported
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
References: <20250514221417.810606-1-tomasz.lis@intel.com>
 <02bab0a3-8f8f-4cca-b100-7e73f7f26f31@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <02bab0a3-8f8f-4cca-b100-7e73f7f26f31@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0043.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::20) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|DS0PR11MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: 77ab9eef-e0e5-493b-c9ad-08dd93a04c92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUpzYnRPdW4zM3daOWlpbkxxcWxMZUVGZ1JyS25hUFl0bm9oU1hoNTYwL3Rw?=
 =?utf-8?B?SnA3eUJra25wS1dzcVVtTjQ1V3dBNFZWMi9yejl4WlBRMHV0eVRSalVVaDdZ?=
 =?utf-8?B?STFxMUsxRFE1VEUza056WjJON0VWM0h2bVUrRGdNdXFCQ3JpQngzSlo2VjM4?=
 =?utf-8?B?KzJnUWdDc1RnYjI4Z21xQ2JSVENmaHNtNVdObXNpVEhEQm00dGFoMWliaTZQ?=
 =?utf-8?B?SUJ5elZjSnFQblcrdWdvZ0pIZ3JYc1ZjejBZSWtHbkEydkdsRG1lbEcvZkda?=
 =?utf-8?B?elhYMmpmNWMzL3ZHZmtxTzZoNEVic0M3ZGxiQ0ZwNmljZWo5bVM5djNYMm91?=
 =?utf-8?B?aVdVZ3pNU3h3aXlEdWI4OWZoVVZoZEpTbjZVemN5YWdSbXVKakhOVXNhQXRh?=
 =?utf-8?B?Y3gyQXp3K2d3cy8zRnZuNE51eVAxOTkrSmsxUkJvZklVS3ZDT2tKSCt6aGJJ?=
 =?utf-8?B?eGxFZVRlWE9vbi9SZGNzeFg4Y0Q4NnV3OUxiK25SdGxGK2JYU3RORnlpaVgx?=
 =?utf-8?B?c0JRR3N2TVRSdzl3Z2dWdDlOalcrRFZERHYrR2RhUHpQRXMzTjhacmRoNFBo?=
 =?utf-8?B?SStoUkQ0QStBRVE2Y3ZoQ05VQlRnVTJ0RFhLOGp6Z3dHek0xd3ptK3V6S2hr?=
 =?utf-8?B?UkpSeSsyTzV0OGhzMzJNT3UzTmJiZ3dYd3FodTk0ZWxpTXhhZVBwczhxQnJT?=
 =?utf-8?B?clhpUXJiYUhPam5wSEQrL0dMRDcxYllYN01SSTZBT1JpSGJuaFk4UVRnRDk1?=
 =?utf-8?B?YUpzL2ZXcDlBMG5rV3gyc2NiSEx1bE9DQ0J4dFpxSlhVSXJHWDhoNTdkWmNu?=
 =?utf-8?B?T1U0d0xPRUJxRkJUSURQQ21PdXNKTnh6LzRSb0RjbjZzelM4UVQrRUx4eWVZ?=
 =?utf-8?B?VVZ0NWtlTnBobkMyeVMxVmN0L1ZuMEx2Y0VIV3JmSldNUXdmR1J0bjVsbWgz?=
 =?utf-8?B?ZGZWZ1pNcXpsaFVkMTlrYmlsRVhEK1UzZDZCTytxRGRPMGwxaStQcGt0VWpZ?=
 =?utf-8?B?TVZpREZsNWUwcDZzWDZKSFFobHFXZlNuWHRnOWFkUmhIdDRiRnE1cmFGMWMv?=
 =?utf-8?B?QTgwS21IT1c0cGtUVGhBNmlkc0VRVUNXMjhTckVQV3Nla2M1ZEVWU0JXTUs4?=
 =?utf-8?B?MlNjWWlOWTNNdWVIaXFtNlNwY1NQaHBUS2RtMUthQmROeDVlWnk0ZkhyWnVa?=
 =?utf-8?B?alY4bjcxU1ZZWGhxUXFOVTNIRDBqcVRaUTBxNzkxcm42K04xb3hYeFJFV3U4?=
 =?utf-8?B?TnJJdkRyd1RGcGNaY1Q4UnFlZmovZm91djBXTW9jczBPSnh3a21pdnphaWF3?=
 =?utf-8?B?L2lRNXBmU3M3WklnbUp2ejl4cXFaTlJGakZxdWltKzhBSUp2ejdWYzYwOW04?=
 =?utf-8?B?ejRsbndST1hNbUVvYXZhSVNJSVIwa0ZxVVZjUzRudUxCY1NlOXRNQ2FWNG15?=
 =?utf-8?B?Ui9JSE9hZjFyK2FDdUUyUkNiSnlQWEFpNDZheVl6bDg3MHRjZzBVTFp0Y0lD?=
 =?utf-8?B?QmxsNXlpalg5Tm5KRmxtNHphZ3RJVG0vTytlSmduWGZHZC9EVnJTcXhVSFFE?=
 =?utf-8?B?WjFROFBHV2plMTMxMDNleUl2UjJybEVJSmcyMFlMV09heWZuS1VUdG1oMllT?=
 =?utf-8?B?SkVuNGV4NzVpbDlVcTZydEtNVEkrbm1EcC9sd0lmZERkMDZuQTl1eFM1VVYr?=
 =?utf-8?B?SHF3eTIxWnVPa0RJa3NqeVNmMy80SUg4MS9HSHloWXAzc2ZVekxlNFZUZFRR?=
 =?utf-8?B?aEtibUdGTGxDS1A3bW1MbXp6NnBDVy9tbVAxVDgraE5ESWNpdnlhQmdUdTdM?=
 =?utf-8?B?cDRsZEZpeWk5Qzh4Q1JOcENlajhpN2dsKy9CWk5EN2x6NzUzRVM3Z2w3Nmtu?=
 =?utf-8?B?a04zekxLN1h1Mms0ZGRTV2tGYWhTcGZCTDVKalB3aWtHcVFRR1ZubUsrTTln?=
 =?utf-8?Q?gn6/JkvfEog=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUFhOE1PS1JTRWhoME9HMVUxR2Evb0FqM2ZLdnFBVWtZa0RPVUVJZGV5bGcv?=
 =?utf-8?B?TnU1eWMrbW9XTlI2b2MrSklmSEFFQ3pELzUzQlBLd0x3TWhoL0gvRHNrZE5l?=
 =?utf-8?B?QkVBbGNqTUlSWE1OQ3pZcnovU2pRRGZtZEliZjdmR2RGeEloeU1TdWd1bXFw?=
 =?utf-8?B?UXoyWk5uYWQzUUhQaE9ueDVLVndJV2RLQzU1ckVsaFpYRUlTd2h0bjNDbXdo?=
 =?utf-8?B?NEw3TmkwOVY3d3huaHpDYUgvZmhta0NMSnJYU0oxMzljK3B1cTNzRFRCbUUv?=
 =?utf-8?B?cGNMQlNyNHB6b3R6VkZ6RWFwajQwUVl4SG41M1lqUEsxZU1mTDlORUlyWmxr?=
 =?utf-8?B?NG11L2cyRmcvT0JZcUg2aFBQTXpLUXdqa3pLS1N3NFNvWEhaSHNjeUVlYXFX?=
 =?utf-8?B?bnEzWDBzNmFpcU9wWGxTNFN3VElVNkpPbnR3TTZaS0YyWXozQys0aVc4dVJB?=
 =?utf-8?B?YUpndXgxSjdMUVF2UVVUVUZJWDF2RVpmdDA3N0s0dnMzYVBBUWpWSVVRWG5z?=
 =?utf-8?B?bkU1K2V0K251SW42cGhoZ001Nzc0ODRDN09tam4yY1B0V25rWFJuRG5Jd2cw?=
 =?utf-8?B?dG1qbWEwOGpxWWVPNUFQNkIxY0VWT3BVTnFTVkZQUmFVK3BkRUUvT2FPY1Jm?=
 =?utf-8?B?RDZvTkFhc05GRmN4MkFKN0FtVzZxQUVYS3JkR1ordXIzNEpkcEgxd3IyRnRF?=
 =?utf-8?B?UlBHd2ovQW0wL3E1L1hIaE1EQnBwcnpiL0dpa3R2aFFLSFJoNjBqMWRMYlMv?=
 =?utf-8?B?Z2RwY0hXTmxvUk9HR3BHeGFxRWdXeEdqc24zKzNhVHo0WTdlQVVYZUErbkdu?=
 =?utf-8?B?NGJ3bmxuWUZPbStxbUJ0dXh4NXpMMStQZ2lKNkNPOXQ0Qm5nbEVNR1NhSGVT?=
 =?utf-8?B?bnphQ0RMeEpyS05PbkZiU3VhMUdxUVk3dlJiSTkxZVd2aEdvU2lIOXpvRzNn?=
 =?utf-8?B?ZXowekJHc0RjVldGc1lFN0FPWHRxTmt0UUY3MDVIMGNmdWVRdENpWEVXZG5H?=
 =?utf-8?B?NzlkSVhYSnZWVEZMaVllTWdFak0zVk5FZ3dXYXJkRUgxYmFRRHViZFNUR2Nr?=
 =?utf-8?B?OEdyU1ZyR3Jqb2NDTnRaYXAzOE9Ua01tUFVpTmp3cVJPTDZ2d0p4TWJINUlr?=
 =?utf-8?B?MngvdkZqMWNPTFN5SVdobjJUSEJ1YldyS1daOENCVjF5Z3ppV2dINUV4SUNm?=
 =?utf-8?B?bDdWQU0yaG5tSjFTVEIxZVVwRTUzUkpzMUM2RDN2anI5VjhoelZ0cndpd3ZQ?=
 =?utf-8?B?dWgvTnhtTGhnSXFETVlhdHdac1dlYTV1dDdpM09PUkR1Tmp3ZzJjSjdDZlor?=
 =?utf-8?B?Z2psc0h6WWpPSlRzVDFDVnN6V05xZUM4UTFIVVVTSWlmSnhmVXlLWmx1em5h?=
 =?utf-8?B?NjZ5UVJaaXIxSklXcmpucE55UkxDam9uVzZyZUhqUnpVbmhBaGZ2QWxudmho?=
 =?utf-8?B?by9GejdFNFZ6NUdFZnRXdU9QZVpvMzdOQ3dQRkZ2M1hVaFVVdFdGUXA2OUVE?=
 =?utf-8?B?TkhLOFpCdVRGVUZMdVM3b0hrQStBdUtFT0pyby90V3VrWnRobzEzT0pLWmRK?=
 =?utf-8?B?WmxFc3BMQ3hBSkZ4WVd5Yk41KzhDSXFsUVpxSnpHVWdlc3cxalZwY1pXQTFm?=
 =?utf-8?B?aysvTkRmOXpYeXROQlp2WVBCUFdMb2s1dFFFQTR6bWtCOW80azNENGF5QXJv?=
 =?utf-8?B?UmF2MXVnelpqR1lxZ2tBUGcyT0liRUdMZk9RQ2h5eE50RjZxeDJaUm4rVkVW?=
 =?utf-8?B?VW91NktuZ0t2ZnNkYVJ3aFNBOExyK3Nmb0VlcHJaMStVdUsvZGRtZ2Mrc3lz?=
 =?utf-8?B?TTljS0RCOVMyVlpFMEFaUDA0bXk0ZTRhejFVTnFhM2lOS2J5YzNoSWM3Y3dv?=
 =?utf-8?B?aGhrS1BORnpGSk0vWWdQc0t6aERVRmtra2NrYktYSGNoakd5c0tpbStwRWVR?=
 =?utf-8?B?ejUxSUh1aDJrUkYzSUptK0xlRXY1Tm1BUGxla2VRc0VVNUFSWWlUV0VmVFRz?=
 =?utf-8?B?Njl0S0NRZkdaRFk5VjdmZ2VKU0dKb2lqSGJWVlRHV0FzWGpaZWMyM1YyeE5U?=
 =?utf-8?B?ZEZudU04RzREV3hMUXBsaUQ2Z29ZaFU1N0ZYWlV6ZCtKY2xwK2kxZ2ptRmFq?=
 =?utf-8?Q?z085IrsxewwH01CMbFin0xcaD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ab9eef-e0e5-493b-c9ad-08dd93a04c92
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 11:04:44.8016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sAJYJ7Ll492f0UEQVUJkQQh0Klqc9R04mGqaggA9WunwfXM0o4PbD5fNme++D0+pZmCWPWMZf1szuRd6zqBqPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8072
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


On 15.05.2025 11:51, Michal Wajdeczko wrote:
>
> On 15.05.2025 00:14, Tomasz Lis wrote:
>> The post-migration recovery needs to be fully implemented for a
>> specific platform in order to make continuation of workloads
>> possible.
>>
>> New platforms introduce changes which affect the recovery procedure,
>> and without a clear verification of support this leads to errors
>> with no straight forward error message explaining the cause.
>>
>> This patch fixes that issue - it introduces a message to be logged
>> when the current driver is known to not support the current platform.
>>
>> Wedging the driver immediately also decreases the amount of
>> additional errors which would come afterwards if the driver continued
>> operation.
>>
>> v2: Show the message during probe as well as during recovery; do not
>>    perform any recovery steps if the reovery is bound to fail
> typo reovery
ok
>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_sriov_vf.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 2674fa948fda..bb069e4b3823 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -123,6 +123,15 @@
>>    *      |                               |                               |
>>    */
>>   
>> +static bool vf_mgration_supported(struct xe_device *xe)
> typo mgration
ok
>
>> +{
>> +	/*
>> +	 * TODO: Add conditions to allow specific platforms, when they're
>> +	 * supported at production quality.
>> +	 */
>> +	return IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV);
> maybe in case it's not supported we can print the message right here so
> we can avoid two similar calls later on?
The idea behind this function is to be condition check function, it's 
not planned for having any action triggered.
>> +}
>> +
>>   static void migration_worker_func(struct work_struct *w);
>>   
>>   /**
>> @@ -132,6 +141,10 @@ static void migration_worker_func(struct work_struct *w);
>>   void xe_sriov_vf_init_early(struct xe_device *xe)
>>   {
>>   	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
>> +
>> +	if (!vf_mgration_supported(xe)) {
>> +		drm_info(&xe->drm, "vf migration not supported by this module version\n");
> s/vf//VF
>
> or maybe just use xe_sriov_info() which will add "VF: " prefix for you
>
>> +	}
>>   }
>>   
>>   /**
>> @@ -236,6 +249,11 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   		goto defer;
>>   	if (unlikely(err))
>>   		goto fail;
>> +	if (!vf_mgration_supported(xe)) {
>> +		drm_err(&xe->drm, "vf migration not supported by this module version\n");
> same here (or print inside vf_migration_supported)

will change the printing funct.

-Tomasz

>
>> +		err = -ENOTRECOVERABLE;
>> +		goto fail;
>> +	}
>>   
>>   	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>>   	/* FIXME: add the recovery steps */
