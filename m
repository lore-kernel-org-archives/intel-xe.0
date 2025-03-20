Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB34C36001
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 20:09:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B99D10E2A7;
	Thu, 20 Mar 2025 20:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZnWLkn3f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4FF10E2A7
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 20:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742501392; x=1774037392;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JnWW1K0+FS4QGbm+ItyYOCVRtJbKVEKtna833xiWoN8=;
 b=ZnWLkn3f0NOM9uqa3po9ZfBvTS0K/UJKu+qzDkSujsn/wmvZVmWcckeq
 xMS4sJVe9UP9lHXo4Ul7Mw2md+sulyCYGxpddSDgZJPQ08PnEZ5IsUoGS
 0m6hjf4JTbLtOdUfVCQAEKPCuq0b7MbRHktJ5lrW/A7CxhrXCq7/nH2uR
 xdyRHDnIfpiYh+qXzyCiRvHvf8WP7E/nOCP0HIPHiuEF531RCR6B4F7Gh
 7U7ntUqdW0Nycab/1xOUdeCmQ79ug/CqMWxChInEdNJB4u83CCrxWnaK8
 weTEeBuu3XLq2dcfUAZBFM2mEpCgkXEGPg2Zk1E1w0mA41u6w/tjMlksU A==;
X-CSE-ConnectionGUID: no5bls4zTJufsow4kH+axw==
X-CSE-MsgGUID: q7L24qJCToeLcPRdJ3OlVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="46510338"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="46510338"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 13:09:52 -0700
X-CSE-ConnectionGUID: NoeBEz59S6KaEVLJFGvHKw==
X-CSE-MsgGUID: cuh1s43aRYKq0SrFpCLRGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="146428614"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 13:09:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Mar 2025 13:09:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 13:09:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 13:09:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fuluhexEuZzESvBVjQKPN0nFD62OOUSYCMDdPwnugXUlbatSJ28ikHMsSGpTWaatXKusoQ3bpWMJgccNL7hip+fX5DdmSlBQFp8gtEK36NXDygA75944z1B5S/DPk+w1xFuBWFu5bXrntrDOWTEokKF5tXDQtQElG1h17FCVlL/QcclLBtQLUmGeltGNQtNWG0tm5dl2aZxgYUGUTD6DvIzJJ+bRG9OHVNks5toWZbDsRjprNfzqP7oR1oFIgvqPXmrJTWWj77QzX0XgMGtWrSUGGwXkfSVhSXj57terhOrQhpAOC6CU8I8faPlCdCQPduMB477tzaAgDxsvzvZ40A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtDV0ML8DCGrvTYBiIffdigiy8wS/w9Mt/+gWCVb2aw=;
 b=G7TI9mjq/DpiJFsofD/e5QOcTo5qtdsH3Ln10VMjzTT7nNMvcygHxJt/qI3rq3lgVN64CdEGjVeyP05GlSO7MBMnc86Hr2eaHzv85yICVmHNOuPQcoYiR4FdGGFvFd2P/49exIe05MSYnAl0xJfE/ybS+YZBd9/BmbfOgZfUPHRSzXgbG7E+SuqbvyHqhU3gpdm7v0Nn8/iKIz4iw3jM0SsAClykeAIRi1B3PIAIYPamBf/BpxZU+yGme0729WDU3xbkhBaJgccqZehMplSv/ejWSLGlbSHEX2M3Fy505qrXJAOhWA7ogoF+nC7n2/FsbPXmJkbkZFp2MnnkKDaN2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 20:09:21 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.8534.031; Thu, 20 Mar 2025
 20:09:21 +0000
Message-ID: <b61776ff-e409-4e2f-868d-ae564362a13a@intel.com>
Date: Thu, 20 Mar 2025 13:09:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/uc: Add support for different firmware files
 on each GT
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe
 <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
References: <20250307-xe-per-gt-fw-v1-0-459574d76400@intel.com>
 <20250307-xe-per-gt-fw-v1-2-459574d76400@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250307-xe-per-gt-fw-v1-2-459574d76400@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:303:16d::22) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH0PR11MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4ea9cd-17e3-42ec-401f-08dd67eb1a60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUxnWEJTY0wwbHNaM1oydk9tUXJtdXRDL3pGenFDUUNFUEkwNXprK2sySmdD?=
 =?utf-8?B?clVVRmxiK3puL2lHQ2pEbmZBNjJlYlp6dVd2TVk4SkFCaXVTU3NMOURTQWRu?=
 =?utf-8?B?aSs5aXV2TW95TjBSb09DdzYrSDZMR3NtdUJDNkpGWDZuSkVYSWJ0T29ENkNZ?=
 =?utf-8?B?NTJjWk9tbk9XT2RLL0lGQktkbi9qVXZlL3o0b0lyVmZ6TkhwVW1RZ3M2bjV4?=
 =?utf-8?B?WFBwbktTeVVnVU1KaEVNZE1heGx4ckpyNGF3U1crUm92UUhud1BkUG5ncTJZ?=
 =?utf-8?B?OGVobUV1QVdwNHcvMmFmdXArRmZWOWRmelNSMlJGOTY2U0Z6ZFZJK3h2NGZR?=
 =?utf-8?B?MEcrcDBJMDJGTlZuZFRZTlJ3cVVYVThEQmhaTU13bmhDTWxMRkNtSTdVMmJW?=
 =?utf-8?B?ZEo2QWFpbzNHRnpzVFVYc1l5aHVBcDIyL200UVcza1hzTjhCQlBlSHlLWVhC?=
 =?utf-8?B?ZGpNMU5uQWh3NHNjbU9rU0pHYzdUUWFtc2ZqQXV1SlRLQTRxOHU2dEhkQ3RD?=
 =?utf-8?B?cjl4VTR4eGZsYktOM2hsSzBzdXFVb2VZSDEwdERYWE1RdGlGR21TVlI3SlZw?=
 =?utf-8?B?ZFlSdExHenk0emljT1JQZ0hZTVg0N0hqbzNOTmFpTWlwQ2FBNWp1Z25sRndm?=
 =?utf-8?B?ZHhnRU5jM3AzZ0tCYi9zREFkU3lZUjhLSnNLUFFQOGxTNmc3OHRhVkNKNEV5?=
 =?utf-8?B?NkJiUWs3eW9rQ0lSa3N2Tm1VSmJQWWVub2JnTHNPWGNnVElObnlneGZmM3Nk?=
 =?utf-8?B?MnU5b0JWZ2ZHNmlMdUkwSkM0Nzh6UkFudWwwajkrWWlLNGM3TGVtVWtneXY4?=
 =?utf-8?B?d3hQVWpJckh0V25rU3hxMG1IUE9kTXNjRGVYcS9DdTRFM1FWVTBadmJvK3N2?=
 =?utf-8?B?OURzUnZwdFI0b1hUbk4vUkgzbHNyMS9zOUxMQ3h5TDNOWW0va1VtQVZDaTlS?=
 =?utf-8?B?akk5ZUx2RDNWTUc0Q08xTTN1TWJlalp2Rjh0TWVuOFIwYThxR1B2Z0FjaFVW?=
 =?utf-8?B?WXQxWnd6V3dmZ3gxcUFCSGVuUlhHeXRrMmhvNEY1dzVTb2ZYM1p5b05ieitV?=
 =?utf-8?B?dmJCdXZ0UURUQkFFNGRUU2xUaHZNcHpwVXBQQTVYK29HZ252bDltMElaalps?=
 =?utf-8?B?S3lMK0ZvWWs3MzdFZTB5eWM3K2Y0UGc2YmFsNW9hZG0vNTBSNVB4ZkV0QXFk?=
 =?utf-8?B?eHJueEdUN0dIb1p4dHpyUmY4WDhtZCtDVG1Ic0dGM0F5MEVSSFlkN3BJUytH?=
 =?utf-8?B?bExiNGhEOFM2OUFYWG1hLzZ2TWNlNnpDOWRVbzNVdUNyLzlqNHN4RTdhVnlK?=
 =?utf-8?B?Z2tHWWgyNUJGZVNIdlYvbnRWWXh6bThmSG15T2VZVEVlYzd4a0luZ29pbG1n?=
 =?utf-8?B?b1h6cDJLMlgxSWVSb2ZiRW51dzlPZWJFRzNHOGZBb1JhSEFoRTdiWGpXU082?=
 =?utf-8?B?VENuakdzL0dmd3VGTURqbUQwdzkycGFyakE5NmlKcXpKbFl6R0lIMnJDYVRJ?=
 =?utf-8?B?NlRqeFBaV3hJZVE0dkxIa0pBVEdDbTh5YzhGdklaanZ0ODljNGFTeEFkM0Jz?=
 =?utf-8?B?UXdWNVhtSW1uQ2hDZXBHaHdXUk9zYTlkTUMwMHhlSTg2TGpTUVFYMFJoa2Rw?=
 =?utf-8?B?Tkd5OXJlMy9TTy9XQ0lGRTRWVjlOZ2krTEN0WmVNSlJaQUtRc1ZGclVWR3cx?=
 =?utf-8?B?NTF6UnRtb1V3RUVGWmZrQzVxV1hVczU5R0tPbHZvcUJHZTZER2dSYXA0aUtz?=
 =?utf-8?B?azQ2Mm43aUNHYjRqSTA4d2wybnZOWEs3RGZadmFyR0FBbGcxMDlXc2RHOGNr?=
 =?utf-8?B?bGtiN0pmaTJMNVYrUTBYSXJpZlg1QTBYODFhSjVTR3hwVnRJQmI4cXJmRFBV?=
 =?utf-8?Q?fVcwwx/SnFsUu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVBBb2dzQWh5TmNNdXpUdEUwdng5cEdFdFRmY01HRnZtUzRncU5oSHFFL0tj?=
 =?utf-8?B?aHJmNlNRL1VFbytJdy85ait6MFUzV1A5SWJhRlJDc1A0VXE4RDJVM3Zqbzl2?=
 =?utf-8?B?bFpBNmx1bTlPTDZLdWZlSVpKQk5SeHQrYVo1VFR2WnhtckZlaDd2Q3hjUjVq?=
 =?utf-8?B?aXhqWFBEMjl6Mk1iNldIakNJS1VCa1Y5OUxacWlhR0NFZ2habVplOE1jdml1?=
 =?utf-8?B?dDhVRTc5ZlNaUlZBK1RzdnBkNTNsTUJoZ0VYSHNxam5NekNkS3BFalhLWWFa?=
 =?utf-8?B?ZWZXdzZHRnFMeUFCU2gxTlZiTWExSGZkUWxPVDc4UUJqcW1xVi9xNjRDSkp2?=
 =?utf-8?B?aDJmcWN6a240WTR5MzZkTVpFaEtwWTlIazJYeWM5MUxwajBocDU0aXNheDlR?=
 =?utf-8?B?Unk2M3pWdi8xVTJXMDZRRzluaVZoWFYzMk1vbW1RRmJYVkVVNkNpbit5cnVS?=
 =?utf-8?B?bWtnRjUxMEFqOG15SFFvdUNGS3ZRa0M1Nk04MWZhdjFSbmZyQ3gxTXZ2NWRS?=
 =?utf-8?B?TCtoOUVZZ2lIa3RibVM4NmVjTTRpckowdWthV1h0UjZrU2FzOGZSNVNQZlpH?=
 =?utf-8?B?c1pKYlJoeTRnTy9ueHFQdkZBcFFCZkU5bGVHdCsrOXk2NTljT3NRSFArR25u?=
 =?utf-8?B?WkVBWHlVa01pSDAvcFJXeFV1RW4xNElCRDZtcndIZ1FaQ2QyRGQvKzN6MzZh?=
 =?utf-8?B?V3hMMjV5RkZDSW1MNTJKQklZOWordnM2MlVXL0V2TzNFUHh0L3FtdXBlZU1L?=
 =?utf-8?B?RnMvcVhha2VVN3dYN29LbkthYXE1MFZsa1NzdW5LVzVtcmhFSDdhSXh1N01x?=
 =?utf-8?B?RzhTZHZXWFBBaVBEZlVkU2hUR1VKSWp5WFlZNXU0TmZnb2xKMUJUalZLRGxS?=
 =?utf-8?B?RDZCRzhzM1pMdjJGdWZLUlU1dmphaDNEY3YwNU9lZWQrend6SE5pUVJ4djVR?=
 =?utf-8?B?MFQ2akJjUURRQUhWMGRCb1JxZE05L05SVFB1MTlYUkIycXU1ZUxrL0JvVnpM?=
 =?utf-8?B?cGFNMnZWN3ZUdW1sM1VlU2h6Y1Y2ZkQ4NlN2SWxZckRjdzNJK0xEbHhEMHU1?=
 =?utf-8?B?MlBTaEJXMnBBSHVUTTR4VHFicGNHT0JJOW11MTdOaUFVTzcvNXIyRzFZc2Zp?=
 =?utf-8?B?QUNlV3hJRnZZSENIZUtUWkM4bWdlOFR5R3g4dnY3NFBjLzR6OG5WUmtNMVEy?=
 =?utf-8?B?TmNMOWxlMUZkT3B0bmJmTkZ0c1ljc2NkZUFvb245UjF1U3dEbVJrUGJjd1Z2?=
 =?utf-8?B?N0dTQ2tjK28xeDVoTUVFV1AzYkhFME1RdE9BN2JvbmYwbVhNbS96RDBMZi84?=
 =?utf-8?B?bjNjYzJBVVlhU2VURldCRjcyTGh5Rm51QUJuRHdMM25sUlp6TWxwaWZJU3oy?=
 =?utf-8?B?NE1hbFc4NitLL1d5Z04wSG94NEZrWUtvYyt1TFppWGlBa2xSY0tpZ2xZK0Ja?=
 =?utf-8?B?NHFyUFVPZ1hUaDA3dFVyQ2x2TStYSEhkeHdqMnAxTS9DUXB5YjBKK3UxR2g4?=
 =?utf-8?B?RHBvZkZFUjdkRGJPdm5JWkxtYjEwVWNqZ3d6Kzl0T004dkw2TU1VZTBpNCt3?=
 =?utf-8?B?MHduRjBJL205Rlkrd2lqTlFzOVl3NGE1UjJPQjVDWWhob0RKNFBsR21hbUtX?=
 =?utf-8?B?Y3AwUzRuZTlsNDNLY1FmUU8wY0tZZElxYkxlMmlTcHVvVWFtYWN0N2h1ZmV6?=
 =?utf-8?B?OVlrdlZEaTljUDYxb3hkcGtubkxENU1FcHRnY2NGZnlUWENnTHY4dWxBNUxD?=
 =?utf-8?B?dTU0M0hNRUo3YmphZlZ2dmtOblhubTY0UHVLK0JCWFFlYkZhTE1RK1dkZWR5?=
 =?utf-8?B?Yk5TN1lCSFVteGtUSGduYVJ0amFOQUdNTUJ5aHZYYTFjTklCQVJzT3VGeVFO?=
 =?utf-8?B?R29OTFp3NXdvc21VTlFqaURqTHEwS3JxRVJENDBmNG9CVzM5UWZsZjEzcVpS?=
 =?utf-8?B?cWU2eUNyNmxwdVZlWDMvc0NHeSt1a1ZIWWgvN3JMSzM3bEtzS1hVbjlGTlNr?=
 =?utf-8?B?TDF2SFR4QkQ5b205SnFUamc3Y1pHaHFLdk4rUzk1ZlhyV0E1WmM5L0MzYTg2?=
 =?utf-8?B?M0F4aDdpNkxXVk9FMnd3TU5MQnF1d2x1ejBUeXprQmZQS1JJRmdQZmRpWjVQ?=
 =?utf-8?B?VTNCaXVDcElmMC9CTFFkNDdHWTFkVDVERjN1bitaVXdQVGFTTi9pNkVER3Zx?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4ea9cd-17e3-42ec-401f-08dd67eb1a60
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 20:09:21.5792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2G93lpSjBo4BgtGngvtw8rhe2mR8JbVmAwtL/cjJne22AkkC5Gn/APv1elzPd/uIiCd3ObydL4O3Cx2MD17tWaDKs5GthZAwFrMLLaAqzfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5830
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

On 3/7/2025 10:13 AM, Lucas De Marchi wrote:
> The different GTs on a device can be very different. Right now for all
> platforms the same firmware is loaded in each GT, however future
> platforms may benefit from loading a different file depending on the GT
> type.
>
> Based on previous patch by John Harrison <John.C.Harrison@Intel.com>.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 100 ++++++++++++++++++++++++------------------
>   1 file changed, 58 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index c22da0ce9fb0d..a230d0501f804 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -92,6 +92,8 @@
>   
>   struct uc_fw_entry {
>   	enum xe_platform platform;
> +	enum xe_gt_type gt_type;
> +
>   	struct {
>   		const char *path;
>   		u16 major;
> @@ -106,35 +108,40 @@ struct fw_blobs_by_type {
>   	u32 count;
>   };
>   
> -#define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> -	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 38, 1))	\
> -	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
> -	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
> -	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
> -	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 29, 2))	\
> -	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2))	\
> -	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2))	\
> -	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
> -	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 29, 2))	\
> -	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
> -	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
> -	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))
> +/*
> + * Add an "ANY" define just to convey the meaning it's given here.
> + */
> +#define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
> +
> +#define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
> +	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	ptl,	70, 38, 1))	\
> +	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
> +	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
> +	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
> +	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 29, 2))	\
> +	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 29, 2))	\
> +	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 29, 2))	\
> +	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
> +	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	major_ver(i915,	guc,	adlp,	70, 29, 2))	\
> +	fw_def(ALDERLAKE_S,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
> +	fw_def(ROCKETLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
> +	fw_def(TIGERLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))
>   
>   #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
> -	fw_def(PANTHERLAKE,	mmp_ver(xe,	huc,		ptl, 10, 2, 1))	\
> -	fw_def(BATTLEMAGE,	no_ver(xe,	huc,		bmg))		\
> -	fw_def(LUNARLAKE,	no_ver(xe,	huc,		lnl))		\
> -	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
> -	fw_def(DG1,		no_ver(i915,	huc,		dg1))		\
> -	fw_def(ALDERLAKE_P,	no_ver(i915,	huc,		tgl))		\
> -	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,		tgl))		\
> -	fw_def(ROCKETLAKE,	no_ver(i915,	huc,		tgl))		\
> -	fw_def(TIGERLAKE,	no_ver(i915,	huc,		tgl))
> +	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	huc,		ptl, 10, 2, 1))	\
> +	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	no_ver(xe,	huc,		bmg))		\
> +	fw_def(LUNARLAKE,	GT_TYPE_ANY,	no_ver(xe,	huc,		lnl))		\
> +	fw_def(METEORLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc_gsc,	mtl))		\
> +	fw_def(DG1,		GT_TYPE_ANY,	no_ver(i915,	huc,		dg1))		\
> +	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\
> +	fw_def(ALDERLAKE_S,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\
> +	fw_def(ROCKETLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\
> +	fw_def(TIGERLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))
>   
>   /* for the GSC FW we match the compatibility version and not the release one */
> -#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
> -	fw_def(LUNARLAKE,	major_ver(xe,	gsc,	lnl,	104, 1, 0)) \
> -	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	102, 1, 0))
> +#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)							\
> +	fw_def(LUNARLAKE,	GT_TYPE_ANY, major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
> +	fw_def(METEORLAKE,	GT_TYPE_ANY, major_ver(i915,	gsc,	mtl,	102, 1, 0))
>   
>   #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
>   	__stringify(dir__) "/" __stringify(shortname__) "_" __stringify(uc__) version__ ".bin"
> @@ -162,12 +169,13 @@ struct fw_blobs_by_type {
>   	  a, b, c }
>   
>   /* All blobs need to be declared via MODULE_FIRMWARE() */
> -#define XE_UC_MODULE_FIRMWARE(platform__, fw_filename)				\
> +#define XE_UC_MODULE_FIRMWARE(platform__, gt_type__, fw_filename)		\
>   	MODULE_FIRMWARE(fw_filename);
>   
> -#define XE_UC_FW_ENTRY(platform__, entry__)					\
> +#define XE_UC_FW_ENTRY(platform__, gt_type__, entry__)				\
>   	{									\
>   		.platform = XE_ ## platform__,					\
> +		.gt_type = XE_ ## gt_type__,					\
>   		entry__,							\
>   	},
>   
> @@ -225,30 +233,38 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
>   		[XE_UC_FW_TYPE_HUC] = { entries_huc, ARRAY_SIZE(entries_huc) },
>   		[XE_UC_FW_TYPE_GSC] = { entries_gsc, ARRAY_SIZE(entries_gsc) },
>   	};
> +	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>   	enum xe_platform p = xe->info.platform;
>   	const struct uc_fw_entry *entries;
>   	u32 count;
>   	int i;
>   
> -	xe_assert(xe, uc_fw->type < ARRAY_SIZE(blobs_all));
> +	xe_gt_assert(gt, uc_fw->type < ARRAY_SIZE(blobs_all));
> +	xe_gt_assert(gt, gt->info.type != XE_GT_TYPE_UNINITIALIZED);
> +
>   	entries = blobs_all[uc_fw->type].entries;
>   	count = blobs_all[uc_fw->type].count;
>   
>   	for (i = 0; i < count && p <= entries[i].platform; i++) {
> -		if (p == entries[i].platform) {
> -			uc_fw->path = entries[i].path;
> -			uc_fw->versions.wanted.major = entries[i].major;
> -			uc_fw->versions.wanted.minor = entries[i].minor;
> -			uc_fw->versions.wanted.patch = entries[i].patch;
> -			uc_fw->full_ver_required = entries[i].full_ver_required;
> -
> -			if (uc_fw->type == XE_UC_FW_TYPE_GSC)
> -				uc_fw->versions.wanted_type = XE_UC_FW_VER_COMPATIBILITY;
> -			else
> -				uc_fw->versions.wanted_type = XE_UC_FW_VER_RELEASE;
> -
> -			break;
> -		}
> +		if (p != entries[i].platform)
> +			continue;
> +
> +		if (entries[i].gt_type != XE_GT_TYPE_ANY &&
> +		    entries[i].gt_type != gt->info.type)
> +			continue;
> +
> +		uc_fw->path = entries[i].path;
> +		uc_fw->versions.wanted.major = entries[i].major;
> +		uc_fw->versions.wanted.minor = entries[i].minor;
> +		uc_fw->versions.wanted.patch = entries[i].patch;
> +		uc_fw->full_ver_required = entries[i].full_ver_required;
> +
> +		if (uc_fw->type == XE_UC_FW_TYPE_GSC)
> +			uc_fw->versions.wanted_type = XE_UC_FW_VER_COMPATIBILITY;
> +		else
> +			uc_fw->versions.wanted_type = XE_UC_FW_VER_RELEASE;
> +
> +		break;
>   	}
>   }
>   
>

