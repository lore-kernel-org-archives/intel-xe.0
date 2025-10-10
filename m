Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DFECCD185
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 15:00:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C4110EC42;
	Fri, 10 Oct 2025 15:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JngYTdzr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D1210EC38
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 15:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760108414; x=1791644414;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QHkbawSG/DG86yqDD/6pMnZ0yvHLC3cBys4zDM0w/rg=;
 b=JngYTdzrmdIKMeIOGy0wKs4K0NaKUpa/fPwhcuwsQ6CndzjUVdAmWGAW
 7V+Rn3jhipq7BTEbOplK7Fdy6jm5N+uNpYTmPLYL7a5IqXKgNcGnO1DkE
 NcD+2fOk2cZuzHPmuYT55fOonOgU55zw5P61AXHqxv2++bR6GIe/av2iB
 XGdsFFpGbWBMSMvU7rak14jV/bDDJtLWwNZcmJWpzzxh6xlkB4Wg9vqK9
 eMedgTpxolMMh8x1bgh2gC3dh0dwSstn24e8MzKywAC1X7RGnRg17IJv4
 d0cT27oq0NIcp+pgw6KBEsm+Pmtmc7b/BD47h01ZZSQsfeK4F1Ro+GUKN g==;
X-CSE-ConnectionGUID: jjXY1fHsQVKZY9CBpxMTKA==
X-CSE-MsgGUID: Z0eDNgifS9uSXE/LgMUUJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62372168"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="62372168"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 08:00:14 -0700
X-CSE-ConnectionGUID: rd/BYsS9TrSJLjWYVi7KEg==
X-CSE-MsgGUID: +AjK69kwSKaU8HK+hVTrZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="180578932"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 08:00:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 08:00:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 08:00:12 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.32)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 08:00:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INAEYs5S2eKNpuVkerFBKKzSJutRRFYgV8dfFv3oxtUPLsfB8wS2aLVqoW/IN9hNbUAiFe4tNR5oJPvwJOhN2AxhoxD0wric23Tt6QqTBQs+UxQGyGnnLHlNFVsYxA4WzmRGQEmFkXUQrKI5SGbwH5PJ0zazYMzxs8oje+gNKntvVcdLNcz4js+o2CxD7/lliAo4MZ72crnbpgQ5nb4AVWTHfEAVKKqW7wrnAGEFcg+BzJDZJtawMByZRb/ihHNBDYgAfgk3CJ9NCm+qFuhL1OgB9GmhRMHAjSW2PobSoK0NODGj7hlkqi0xNshL3TsNcb76sVj8dq0D12kbdzvEYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLogXb+DrEH1TkwB3y9qVwE601pP7vIRdc9Chlz1Mq0=;
 b=kVhLOL05VAlwrUmEBqTF+R/cHov++nfYS5nlz1/6y1I8WWD2zn9xypUWcF4kXs0dUVp2aQE6+X3P+43FA7a4ECQ/MOndiiVbzPFCAvAazzUVTADU9JaHWp2Yl1Jx2AVXVVawkFmJmeMoIGyGeQ9MdYnYUbYT6T+LkA8g9Q0ypEh5odeiV8L4xFtrdElXymzxjNKWtmaXZ3xutliA4sEawa+pqvNDPJvK3xpC9qTv/okp0Fkkd3NavaK/7X5PAi7vaYXwIq1ONHguiSyFhtJO8hNgBSuUb5leXJz0MTKhgL8VdT40RtB72LhC0UOw3H2mbsIt+2XD6JahckKsYxf3ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA0PR11MB4767.namprd11.prod.outlook.com (2603:10b6:806:97::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 15:00:06 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 15:00:06 +0000
Message-ID: <3f96dc8f-c1bd-427a-b24a-64e7f5877fb2@intel.com>
Date: Fri, 10 Oct 2025 17:00:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] drm/xe: Rewrite GGTT VF initialisation
To: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20251010120655.1046007-8-dev@lankhorst.se>
 <20251010120655.1046007-12-dev@lankhorst.se>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251010120655.1046007-12-dev@lankhorst.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0071.eurprd04.prod.outlook.com
 (2603:10a6:802:2::42) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA0PR11MB4767:EE_
X-MS-Office365-Filtering-Correlation-Id: 40b81687-89b2-424b-8163-08de080db2b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXI0Ym45blN1a0NMdTlzU1UwdVI2UjRQYXFnZmtvL2VMbFZ6NWNtQXUwL1ow?=
 =?utf-8?B?Z0VtT0dmY3QvYUVrdm9wZldrQkZlbzlLc3FjNW4zSWF4ek1mRG1KQ3Q4bVdq?=
 =?utf-8?B?azYrWEVpSERjZlZYVkRDK294Y0xCbWw2YVpkZmZubGMxcUZEa2x3RHR1ZWlF?=
 =?utf-8?B?a1lHVHZZVllmbzd4N3R1aHY5WU1zajJFelFRNW9yL2h2VitwcE5GNk5pdWox?=
 =?utf-8?B?b2F1am81SGtFY1BEaFlIL2ZtVGJpbVJNTDBad3pXemEvL3ZCWWRma2F0ZlVE?=
 =?utf-8?B?Yms0MlluUlhIUFVqNWxjN3FHTmJPMzg5MTBsejFFanN6SWNVcVFXYmdzNnFi?=
 =?utf-8?B?MlZNaERJS0Z1VzlxWlE1ZVduN3hUT2dKcEhvb2l6Y2hwZGw4cHgrMHpXTGE2?=
 =?utf-8?B?YjdyMUVWYlpsL2tsVW8yNyt1ZjdWcy93RlJCSjczM0F3WXl3WXNCVzNCWDVO?=
 =?utf-8?B?c2RBbmYrWmcyY0RGZFU5VXBVQ2w2QUlMOUw5UVF5VUptR2NDY0VaT1FuY3dz?=
 =?utf-8?B?OFRGYXVMTWVvLzJsYm54V2lpckpVYkRsdjZhc3lzMjVlY0dQVVFqL1VTQ3R4?=
 =?utf-8?B?bXBOWC9YTlhZSHRHOU9uWUxLdFVzWW1KVVBSUEhKbkRpUDRRWVJKQnJqTjAz?=
 =?utf-8?B?SHpYN091ZkdURGpHc2ZsQUJwRHdHMWFqREw4SjBpaFRXRlBjV05BMVNCVFBF?=
 =?utf-8?B?YUFTT2srZ0ZKM0VnazUwTkxTV1lvVFQ0K0M4dzB6azZZK010TlVZRVYwZmlE?=
 =?utf-8?B?MkdTSHdFYkhYbkQ5bFNWendMcStrR2VkQ0xWWUNlRFFMZmgyRTloSFZuaXVw?=
 =?utf-8?B?UVAycGM3bFk0a04vNzlsMjE5cjRFRXNNZThjeXJnSnQ2Ym9EOEV4R3B2Njlz?=
 =?utf-8?B?N0dxMndSUmRWZTNNVkw3YVdQbjdlaEpRR0xZcTJKS1lmMWExMGJBbTdsVkJ3?=
 =?utf-8?B?alRBTGN5aTd0dmNvSUtaSTlncEFZNkZUMW84QXphZ3RQdlV0R3krenJ5OVNB?=
 =?utf-8?B?TDI5anVCQUZKVnVkNHJaOE1WQWZlRDhKQW51a2w0NEtyS1lKQUQyU3o5a2Ny?=
 =?utf-8?B?aWsvTVZGQ1htS3dFRm8rRTlFWDNna3NjSDZOcHhldmZnSnpKSGNMNkJicGZI?=
 =?utf-8?B?QjdncGF1b2VNRTZLMzFRZkNkMXQ1SFo4SmFGMnpPVkVzaFBvTitVRXZEVHpm?=
 =?utf-8?B?VDcxOFVpb2h2aGZVbHdqYUoxeXpEUHZDTGhSWENoMDJvMmNIUnFLdW1RQ041?=
 =?utf-8?B?bklJNE1nbHBXUGJTWFhhOTQ1UFpoNjIvcVRpeWNBVTYzVmhkRzdvWXB0WWJm?=
 =?utf-8?B?bE5zbHRUWjZ2TlN1bVlBNmNacWFSMTNsZngvWFNhR3RORUsrNFFkY3QwQnJi?=
 =?utf-8?B?K3BkcmZOb3lUWGp5dzg5b2JnYk11RDJCSlNtb1kzVGIwUzh4ejRFdmwzem5q?=
 =?utf-8?B?TDdJdjJycXdnT2VKWElRZGV0L3RzTFhoWmxTL3gwc0FZaDI4NVZ0MEREeklq?=
 =?utf-8?B?a0VWa0pKenM5azYyV1dMUWlnU09sTmhwVWhpSTE3a0dacFMwOXpOVFJ2R040?=
 =?utf-8?B?bmJ5QnE1L1d6ekV4enFDYkVRa2xmSnVoVk9EeFV5MHpWOGlnU0pBSndhTEZB?=
 =?utf-8?B?by9sUWpVaWtXNWF4eXU3UHlxUFFkbWZjTUhhZVVLaHJ4NEJoOUNWWlhuNUM5?=
 =?utf-8?B?WmhaMlQ2Zm1uUzdtV3ZCdkxHZ0xOcW9kbUVMMUtZUGhLVVRUN0dUT0plZVBX?=
 =?utf-8?B?TERiYVhPQkxuUFJHMU15UmlqR2VYQzg3YndwV2dwTEpEVmJoV3RndklLdmth?=
 =?utf-8?B?RlVGYjBvWjVOZ21jN0xmWDA1a2hQcTNRNzhENVVCUEsrNFgyRkxRQ2tjZzli?=
 =?utf-8?B?dVVpZTY3WmtoNktETVFxNlAwTGFBRFdxMVVFRlJuWWljMXdhVXN1TDlzd2xB?=
 =?utf-8?Q?fTp5K+NIhexUorBb2O3yKJHh/qVeLdXW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnFZd2tlVk1xN2ZWVXFoc3FOWlp5a3ZvVU9LMHI1MWk0bGZ4aTYydG1vMUZK?=
 =?utf-8?B?U1JHcEsxak9UVkVCdFRYb0ROZ1VzRHdrZUdNTWJseXQxaXBRTTAxM3IxWVFa?=
 =?utf-8?B?dGNMZ24yUnNyNjlMYlZDcHBWemlkWHlhL3NCMEl0VmZGNHpCT3hsOTFBRi9n?=
 =?utf-8?B?TC8zRVBxN1JYZWlWQVIwTEsxcjRxV040amgrQUhweGdTRVBUTVdMK3pkbXov?=
 =?utf-8?B?cng5WHBIRk1MRTZxUTRySmI1M0hWT050Y1dobWFsalVYeUtCb0lVdGpKZzJE?=
 =?utf-8?B?c1N0ZlZQbU9vRjh1cnYzS0ZrelhNN2ZEQ3lBWFJKcWw2TU1mY21yOFJwbGFj?=
 =?utf-8?B?bzVWcWpyMmRQWklwWE5oNDhCMVV3b0c4bXl0Z204RThQQ2l5aUExV0RvMEU5?=
 =?utf-8?B?V0RRNlp0T0ZxcXZVWXovWHR4Z2sxeHBCK3lCRkk0U0xsZ0ozMG4xejE1OEMz?=
 =?utf-8?B?c1dxdkUyV1RvekNUVGJ5MkRjY0pPWHJ4RDR5c29kTEdEckVqRVA0VXBjY3FI?=
 =?utf-8?B?aUY5blNmRzI1THBEdnFPTUtTUndnMWdLNm5mZ2hhSlFVczRSUUJnNmhzRU5H?=
 =?utf-8?B?K0k4emVxZ0p5QTBvRXFsbFJ6QUdQcWlXajBLL1ByM0NVV3BmVmlEbTBHRUdQ?=
 =?utf-8?B?cGw0eTZnSlpITTVFa0t1Vmswc05yRlkvL0FBb1hNL0kzZjRoRlpKUnR2NkM3?=
 =?utf-8?B?czlwbUx1VXV3TXlhRm9rVWNaSm01bk5JejI5dGxuRWkxMGRPWk1oTHBOOVdm?=
 =?utf-8?B?RkZLL04vNzhyUVp6dU5aNGVUVFZzYjNvam0vZmhxZXEwcHd6QmRYenQrbFFu?=
 =?utf-8?B?SDc3L0hnU2g5b0xvcEU2dGlWNjhXZkt4ckVpWThqOWVtMThNZzVMemNPaU9v?=
 =?utf-8?B?SUF0SzVkOWlvYXRYVGdxQzVpTEh1cWVVbkIraElQL2tJTzBXQVJWSGl2NjIv?=
 =?utf-8?B?S3Z1amp0ZUV4QndpbzR3YTdtSnpucGExQ3V2Y1JjR0hwWXEwUnV3M0NTTmVW?=
 =?utf-8?B?OTNnaHZLWHFHOG5Xb2o1b0xjc2p5MXJSbmlhaDk2bVUzVjRaeU55S2sra0xG?=
 =?utf-8?B?ZmlCaEo0RFFSRWhYTlphclpLRG9jQ0tMcTlGZElrWnZJZ2hYNkZLdzJIaVYy?=
 =?utf-8?B?NlV2OUVVRTB5RDdnaUszWWYvdDhaaDJPc0FZaFZ3OWU5eTRMSjJ4YmpnTm5Z?=
 =?utf-8?B?anc2d0pRdEZTREhIUCtNamhsWFZSbmhHVXRIQXV1cXhtbW5PMllMTnZWMzRz?=
 =?utf-8?B?WHdpTVFnUHJhWWpmOVNzNVBIV0taU3BtS1U5WEhxVWE0Z0JCMHZQdnRvQUJY?=
 =?utf-8?B?L08yNDlZY1NNL2dBWXB6Q1pFRzI0RGFyY00xRkJFMFIyb3VUQ2NyeGo1MVhk?=
 =?utf-8?B?aXkwa0JEYnJFM2dhbWxCMlRTZU1GRkQ3WjN0cEJjTmtoU3JydEhsUGV2UjVr?=
 =?utf-8?B?M0ozSG9sdzd2ZUg5SU5EbmdtL2RYTHBDcDNyUm9VYzg3TnA4U3pDRFFFZy9L?=
 =?utf-8?B?OG51Vk5ubTdSQzY1ekQyYm45Y3pDY0R6ZlErU1ovTkVHSUxSeTdwa3RLdmxh?=
 =?utf-8?B?U2p2MkZQOXlUbDM2VG1OaUFJak5SNGE5RXV4dEpacTdKck5kTDFHOC9EbjVw?=
 =?utf-8?B?RENMNHZsT0RiazdRaEJPdThQTjlJZmxKQ3BzelgzTG9XazRSZGRwOVprYlNw?=
 =?utf-8?B?Y0ZEVGp4T3RFUmpSblF1T2JoaDlGWERaVzlZam9MRmpZK0xNYmJtQ0dPMUNu?=
 =?utf-8?B?bjUvbVIwNEc5TXR4QTJaODExVDBPRk9CUlBOZ2tsNXBKZDZGYVFTK0pPRXhu?=
 =?utf-8?B?SU9QRTlBcmRGRy9VQnc5RU9EN05qOTJPOWRFWGhhK1k2YjZ0b1Q4YUkxaDhw?=
 =?utf-8?B?ZGtYN0xhdXJYdWdVS2lGRjNucVp6bWkwNFNvK0RZU1lnMHFncEFDSlBVMVNN?=
 =?utf-8?B?WGtDbTkyeFkxLzlxMndiMzNtYVFkSXVMYTA1dUxsZUkycVg1K0dZcjJGRXpp?=
 =?utf-8?B?RmtDdVlZU1QwczFPYlNzWnhUakUrZTZDZm5DQXJWNWlzYW5ta0Y2WmRrMUR1?=
 =?utf-8?B?Y2tVaXpEYWM0a2p3RVdWajhmQkRFaVBheWRXVnVNeEliOGZTQUN0L3FneDJn?=
 =?utf-8?B?YVp1OEFIcE82aHExM0xMQXlCekErd0tOa3l3S1VwOWJFdGtTbHJGS0F5L1VL?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b81687-89b2-424b-8163-08de080db2b4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 15:00:06.1791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4u5ZZ+jEuA4fVYYGQedpTk21IEEallcdqHyS8gK9Qh8+6x+/b3+GXAR4OUaKTTe9pN/zPn+Tq+QA3BbBIECWuIXBoehLpHBlNOiegfigeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4767
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



On 10/10/2025 2:07 PM, Maarten Lankhorst wrote:
> The previous code was using a complicated system with 2 balloons to
> set GGTT size and adjust GGTT offset. While it works, it's overly
> complicated.

for the record:

our previous attempts to make GGTT allocations 0-based where simply NAK'ed
so there was no other option that going with the ballooning

> 
> A better approach is to set the offset and size when initialising GGTT,
> this removes the need for adding balloons. The resize function only
> needs to re-initialise GGTT at the new offset.
> 
> We use the newly created drm_mm_shift to shift the nodes.

by keeping start at xe_ggtt level that could be even not needed 

> 
> This removes the need to manipulate the internals of xe_ggtt outside
> of xe_ggtt, and cleans up a lot of now unneeded code.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> This patch has been rebased by Matthew Brost,
> with some final fixups by Maarten to remove
> the use of ggtt->mutex, and all references to the balloons.
> 
>  drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |   2 +-
>  drivers/gpu/drm/xe/xe_device_types.h        |   2 -
>  drivers/gpu/drm/xe/xe_ggtt.c                | 143 +++-----------
>  drivers/gpu/drm/xe/xe_ggtt.h                |   5 +-
>  drivers/gpu/drm/xe/xe_ggtt_types.h          |   4 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c         |   5 +-
>  drivers/gpu/drm/xe/xe_tile.c                |  18 ++
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.c       | 197 ++------------------
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.h       |   4 +-
>  drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h |   4 +
>  10 files changed, 69 insertions(+), 315 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> index d266882adc0e0..acddbedcf17cb 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> @@ -67,7 +67,7 @@ static int guc_buf_test_init(struct kunit *test)
>  
>  	KUNIT_ASSERT_EQ(test, 0,
>  			xe_ggtt_init_kunit(ggtt, DUT_GGTT_START,
> -					   DUT_GGTT_START + DUT_GGTT_SIZE));
> +					   DUT_GGTT_SIZE));
>  
>  	kunit_activate_static_stub(test, xe_managed_bo_create_pin_map,
>  				   replacement_xe_managed_bo_create_pin_map);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 02c04ad7296e4..a05164cc669f9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -192,8 +192,6 @@ struct xe_tile {
>  			struct xe_lmtt lmtt;
>  		} pf;
>  		struct {
> -			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
> -			struct xe_ggtt_node *ggtt_balloon[2];
>  			/** @sriov.vf.self_config: VF configuration data */
>  			struct xe_tile_sriov_vf_selfconfig self_config;
>  		} vf;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 1fcb128e661b6..cd4b62303e0ec 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -274,7 +274,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	unsigned int gsm_size;
>  	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
> -	int err;
>  
>  	if (!IS_SRIOV_VF(xe)) {
>  		if (GRAPHICS_VERx100(xe) >= 1250)
> @@ -288,9 +287,15 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  		ggtt_start = wopcm;
>  		ggtt_size = (gsm_size / 8) * (u64) XE_PAGE_SIZE - ggtt_start;
>  	} else {
> -		/* GGTT is expected to be 4GiB */
> -		ggtt_start = wopcm;
> -		ggtt_size = SZ_4G - ggtt_start;
> +		ggtt_start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
> +		ggtt_size = xe_tile_sriov_vf_ggtt(ggtt->tile);
> +
> +		if (ggtt_start < wopcm || ggtt_start > GUC_GGTT_TOP ||
> +		    ggtt_size > GUC_GGTT_TOP - ggtt_start) {
> +			xe_tile_err(ggtt->tile, "tile%u: Invalid GGTT configuration: %#llx-%#llx\n",
> +				     ggtt->tile->id, ggtt_start, ggtt_start + ggtt_size - 1);
> +			return -ERANGE;
> +		}
>  	}
>  
>  	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
> @@ -311,17 +316,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);
>  	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
>  
> -	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
> -	if (err)
> -		return err;
> -
> -	if (IS_SRIOV_VF(xe)) {
> -		err = xe_tile_sriov_vf_prepare_ggtt(ggtt->tile);
> -		if (err)
> -			return err;
> -	}
> -
> -	return 0;
> +	return drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
>  }
>  ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
>  
> @@ -473,83 +468,8 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
>  	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
>  }
>  
> -static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
> -			      const struct drm_mm_node *node, const char *description)
> -{
> -	char buf[10];
> -
> -	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> -		string_get_size(node->size, 1, STRING_UNITS_2, buf, sizeof(buf));
> -		xe_tile_dbg(ggtt->tile, "GGTT %#llx-%#llx (%s) %s\n",
> -			    node->start, node->start + node->size, buf, description);
> -	}
> -}
> -
>  /**
> - * xe_ggtt_node_insert_balloon_locked - prevent allocation of specified GGTT addresses
> - * @node: the &xe_ggtt_node to hold reserved GGTT node
> - * @start: the starting GGTT address of the reserved region
> - * @end: then end GGTT address of the reserved region
> - *
> - * To be used in cases where ggtt->lock is already taken.
> - * Use xe_ggtt_node_remove_balloon_locked() to release a reserved GGTT node.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64 end)
> -{
> -	struct xe_ggtt *ggtt = node->ggtt;
> -	int err;
> -
> -	xe_tile_assert(ggtt->tile, start < end);
> -	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
> -	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
> -	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(&node->base));
> -	lockdep_assert_held(&ggtt->lock);
> -
> -	node->base.color = 0;
> -	node->base.start = start;
> -	node->base.size = end - start;
> -
> -	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
> -
> -	if (xe_tile_WARN(ggtt->tile, err, "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
> -			 node->base.start, node->base.start + node->base.size, ERR_PTR(err)))
> -		return err;
> -
> -	xe_ggtt_dump_node(ggtt, &node->base, "balloon");
> -	return 0;
> -}
> -
> -/**
> - * xe_ggtt_node_remove_balloon_locked - release a reserved GGTT region
> - * @node: the &xe_ggtt_node with reserved GGTT region
> - *
> - * To be used in cases where ggtt->lock is already taken.
> - * See xe_ggtt_node_insert_balloon_locked() for details.
> - */
> -void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
> -{
> -	if (!xe_ggtt_node_allocated(node))
> -		return;
> -
> -	lockdep_assert_held(&node->ggtt->lock);
> -
> -	xe_ggtt_dump_node(node->ggtt, &node->base, "remove-balloon");
> -
> -	drm_mm_remove_node(&node->base);
> -}
> -
> -static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
> -{
> -	struct xe_tile *tile = ggtt->tile;
> -
> -	xe_tile_assert(tile, start >= ggtt->start);
> -	xe_tile_assert(tile, start + size <= ggtt->start + ggtt->size);
> -}
> -
> -/**
> - * xe_ggtt_shift_nodes_locked - Shift GGTT nodes to adjust for a change in usable address range.
> + * xe_ggtt_shift_nodes - Shift GGTT nodes to adjust for a change in usable address range.
>   * @ggtt: the &xe_ggtt struct instance
>   * @shift: change to the location of area provisioned for current VF
>   *
> @@ -563,29 +483,22 @@ static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
>   * the list of nodes was either already damaged, or that the shift brings the address range
>   * outside of valid bounds. Both cases justify an assert rather than error code.
>   */
> -void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift)
> +void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift)
>  {
> -	struct xe_tile *tile __maybe_unused = ggtt->tile;
> -	struct drm_mm_node *node, *tmpn;
> -	LIST_HEAD(temp_list_head);
> +	s64 new_start;
>  
> -	lockdep_assert_held(&ggtt->lock);
> +	if (!ggtt->size) {
> +		xe_tile_err(ggtt->tile, "Asked to resize before xe_ggtt_init_early()?\n");

that's should be xe_assert()

or our VF init flow is broken

> +		return;
> +	}
>  
> -	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> -		drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm)
> -			xe_ggtt_assert_fit(ggtt, node->start + shift, node->size);
> +	guard(mutex)(&ggtt->lock);
>  
> -	drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm) {
> -		drm_mm_remove_node(node);
> -		list_add(&node->node_list, &temp_list_head);
> -	}
> +	new_start = ggtt->start + shift;
> +	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
> +	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
>  
> -	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
> -		list_del(&node->node_list);
> -		node->start += shift;
> -		drm_mm_reserve_node(&ggtt->mm, node);
> -		xe_tile_assert(tile, drm_mm_node_allocated(node));
> -	}
> +	drm_mm_shift(&ggtt->mm, shift);
>  }
>  
>  /**
> @@ -637,11 +550,9 @@ int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
>   * @ggtt: the &xe_ggtt where the new node will later be inserted/reserved.
>   *
>   * This function will allocate the struct %xe_ggtt_node and return its pointer.
> - * This struct will then be freed after the node removal upon xe_ggtt_node_remove()
> - * or xe_ggtt_node_remove_balloon_locked().
> + * This struct will then be freed after the node removal upon xe_ggtt_node_remove().
>   * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
> - * in GGTT. Only the xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
> - * xe_ggtt_node_insert_balloon_locked() will ensure the node is inserted or reserved in GGTT.
> + * in GGTT. Only xe_ggtt_node_insert() will ensure the node is inserted or reserved in GGTT.
>   *
>   * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
>   **/
> @@ -662,9 +573,9 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
>   * xe_ggtt_node_fini - Forcebly finalize %xe_ggtt_node struct
>   * @node: the &xe_ggtt_node to be freed
>   *
> - * If anything went wrong with either xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
> - * or xe_ggtt_node_insert_balloon_locked(); and this @node is not going to be reused, then,
> - * this function needs to be called to free the %xe_ggtt_node struct
> + * If anything went wrong with either xe_ggtt_node_insert() and this @node is
> + * not going to be reused, then this function needs to be called to free the
> + * %xe_ggtt_node struct
>   **/
>  void xe_ggtt_node_fini(struct xe_ggtt_node *node)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 6482bddb2ef36..eccef2d2b3cee 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -19,10 +19,7 @@ int xe_ggtt_init(struct xe_ggtt *ggtt);
>  
>  struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
>  void xe_ggtt_node_fini(struct xe_ggtt_node *node);
> -int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
> -				       u64 start, u64 size);
> -void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
> -void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift);
> +void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift);
>  u64 xe_ggtt_start(struct xe_ggtt *ggtt);
>  u64 xe_ggtt_size(struct xe_ggtt *ggtt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index a27919302d6b2..b659ffc612269 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -57,8 +57,8 @@ struct xe_ggtt {
>   * struct xe_ggtt_node - A node in GGTT.
>   *
>   * This struct needs to be initialized (only-once) with xe_ggtt_node_init() before any node
> - * insertion, reservation, or 'ballooning'.
> - * It will, then, be finalized by either xe_ggtt_node_remove() or xe_ggtt_node_deballoon().
> + * insertion or reservation.
> + * It will, then, be finalized by either xe_ggtt_node_remove().
>   */
>  struct xe_ggtt_node {
>  	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 46518e629ba36..dd3cd7f140cd1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -442,7 +442,6 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>  static int vf_get_ggtt_info(struct xe_gt *gt)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
>  	struct xe_guc *guc = &gt->uc.guc;
>  	u64 start, size, ggtt_size;
>  	s64 shift;
> @@ -450,7 +449,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	guard(mutex)(&ggtt->lock);
> +	guard(mutex)(&tile->sriov.vf.self_config.ggtt_move_mutex);

maybe instead we should just get a ggtt info *only* from the primary GT ?

and use GT-level lock only ?

>  
>  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
>  	if (unlikely(err))
> @@ -480,7 +479,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  	if (shift && shift != start) {
>  		xe_gt_sriov_info(gt, "Shifting GGTT base by %lld to 0x%016llx\n",
>  				 shift, start);
> -		xe_tile_sriov_vf_fixup_ggtt_nodes_locked(gt_to_tile(gt), shift);
> +		xe_ggtt_shift_nodes(tile->mem.ggtt, shift);
>  	}
>  
>  	if (xe_sriov_vf_migration_supported(gt_to_xe(gt))) {
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 6edb5062c1da5..be3900681b6d8 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -17,6 +17,7 @@
>  #include "xe_sa.h"
>  #include "xe_svm.h"
>  #include "xe_tile.h"
> +#include "xe_tile_sriov_vf.h"
>  #include "xe_tile_sysfs.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_wa.h"
> @@ -157,6 +158,12 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
>  	if (err)
>  		return err;
>  
> +	if (IS_SRIOV_VF(xe)) {
> +		err = xe_tile_sriov_vf_init(tile);
> +		if (err)
> +			return err;
> +	}
> +
>  	tile->primary_gt = xe_gt_alloc(tile);
>  	if (IS_ERR(tile->primary_gt))
>  		return PTR_ERR(tile->primary_gt);
> @@ -201,6 +208,17 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>  	return xe_tile_sysfs_init(tile);
>  }
>  
> +/**
> + * xe_tile_init - Initialize the remainder of the tile.
> + * @tile: The tile to initialize.
> + *
> + * This function is used for all tile initialization calls that may allocate memory.
> + *
> + * Note that since this is tile initialization, it should not perform any
> + * GT-specific operations, and thus does not need to hold GT forcewake.
> + *
> + * Returns: 0 on success, negative error code on error.
> + */

nice, but since you are not touching xe_tile_init() in this patch, its kernel-doc should be added in separate patch

>  int xe_tile_init(struct xe_tile *tile)
>  {
>  	int err;
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> index c9bac2cfdd044..d1fa46e268350 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> @@ -14,173 +14,12 @@
>  #include "xe_tile_sriov_vf.h"
>  #include "xe_wopcm.h"
>  
> -static int vf_init_ggtt_balloons(struct xe_tile *tile)
> -{
> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
> -
> -	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> -
> -	tile->sriov.vf.ggtt_balloon[0] = xe_ggtt_node_init(ggtt);
> -	if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
> -		return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
> -
> -	tile->sriov.vf.ggtt_balloon[1] = xe_ggtt_node_init(ggtt);
> -	if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
> -		xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
> -		return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
> -	}
> -
> -	return 0;
> -}
> -
> -/**
> - * xe_tile_sriov_vf_balloon_ggtt_locked - Insert balloon nodes to limit used GGTT address range.
> - * @tile: the &xe_tile struct instance
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -static int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
> -{
> -	u64 ggtt_base = tile->sriov.vf.self_config.ggtt_base;
> -	u64 ggtt_size = tile->sriov.vf.self_config.ggtt_size;
> -	struct xe_device *xe = tile_to_xe(tile);
> -	u64 wopcm = xe_wopcm_size(xe);
> -	u64 start, end;
> -	int err;
> -
> -	xe_tile_assert(tile, IS_SRIOV_VF(xe));
> -	xe_tile_assert(tile, ggtt_size);
> -	lockdep_assert_held(&tile->mem.ggtt->lock);
> -
> -	/*
> -	 * VF can only use part of the GGTT as allocated by the PF:
> -	 *
> -	 *      WOPCM                                  GUC_GGTT_TOP
> -	 *      |<------------ Total GGTT size ------------------>|
> -	 *
> -	 *           VF GGTT base -->|<- size ->|
> -	 *
> -	 *      +--------------------+----------+-----------------+
> -	 *      |////////////////////|   block  |\\\\\\\\\\\\\\\\\|
> -	 *      +--------------------+----------+-----------------+
> -	 *
> -	 *      |<--- balloon[0] --->|<-- VF -->|<-- balloon[1] ->|
> -	 */
> -
> -	if (ggtt_base < wopcm || ggtt_base > GUC_GGTT_TOP ||
> -	    ggtt_size > GUC_GGTT_TOP - ggtt_base) {
> -		xe_sriov_err(xe, "tile%u: Invalid GGTT configuration: %#llx-%#llx\n",
> -			     tile->id, ggtt_base, ggtt_base + ggtt_size - 1);
> -		return -ERANGE;
> -	}
> -
> -	start = wopcm;
> -	end = ggtt_base;
> -	if (end != start) {
> -		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[0],
> -							 start, end);
> -		if (err)
> -			return err;
> -	}
> -
> -	start = ggtt_base + ggtt_size;
> -	end = GUC_GGTT_TOP;
> -	if (end != start) {
> -		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[1],
> -							 start, end);
> -		if (err) {
> -			xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
> -			return err;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
> -static int vf_balloon_ggtt(struct xe_tile *tile)
> -{
> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
> -	int err;
> -
> -	mutex_lock(&ggtt->lock);
> -	err = xe_tile_sriov_vf_balloon_ggtt_locked(tile);
> -	mutex_unlock(&ggtt->lock);
> -
> -	return err;
> -}
> -
> -/**
> - * xe_tile_sriov_vf_deballoon_ggtt_locked - Remove balloon nodes.
> - * @tile: the &xe_tile struct instance
> - */
> -void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile)
> -{
> -	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> -
> -	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[1]);
> -	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
> -}
> -
> -static void vf_deballoon_ggtt(struct xe_tile *tile)
> -{
> -	mutex_lock(&tile->mem.ggtt->lock);
> -	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
> -	mutex_unlock(&tile->mem.ggtt->lock);
> -}
> -
> -static void vf_fini_ggtt_balloons(struct xe_tile *tile)
> -{
> -	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> -
> -	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[1]);
> -	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
> -}
> -
> -static void cleanup_ggtt(struct drm_device *drm, void *arg)
> -{
> -	struct xe_tile *tile = arg;
> -
> -	vf_deballoon_ggtt(tile);
> -	vf_fini_ggtt_balloons(tile);
> -}
> -
> -/**
> - * xe_tile_sriov_vf_prepare_ggtt - Prepare a VF's GGTT configuration.
> - * @tile: the &xe_tile
> - *
> - * This function is for VF use only.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
> -{
> -	struct xe_device *xe = tile_to_xe(tile);
> -	int err;
> -
> -	err = vf_init_ggtt_balloons(tile);
> -	if (err)
> -		return err;
> -
> -	err = vf_balloon_ggtt(tile);
> -	if (err) {
> -		vf_fini_ggtt_balloons(tile);
> -		return err;
> -	}
> -
> -	return drmm_add_action_or_reset(&xe->drm, cleanup_ggtt, tile);
> -}
> -
>  /**
>   * DOC: GGTT nodes shifting during VF post-migration recovery
>   *
>   * The first fixup applied to the VF KMD structures as part of post-migration
>   * recovery is shifting nodes within &xe_ggtt instance. The nodes are moved
>   * from range previously assigned to this VF, into newly provisioned area.
> - * The changes include balloons, which are resized accordingly.
> - *
> - * The balloon nodes are there to eliminate unavailable ranges from use: one
> - * reserves the GGTT area below the range for current VF, and another one
> - * reserves area above.
>   *
>   * Below is a GGTT layout of example VF, with a certain address range assigned to
>   * said VF, and inaccessible areas above and below:
> @@ -198,10 +37,6 @@ int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
>   *
>   *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
>   *
> - * GGTT nodes used for tracking allocations:
> - *
> - *      |<---------- balloon ------------>|<- nodes->|<----- balloon ------>|
> - *
>   * After the migration, GGTT area assigned to the VF might have shifted, either
>   * to lower or to higher address. But we expect the total size and extra areas to
>   * be identical, as migration can only happen between matching platforms.
> @@ -219,35 +54,27 @@ int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
>   * So the VF has a new slice of GGTT assigned, and during migration process, the
>   * memory content was copied to that new area. But the &xe_ggtt nodes are still
>   * tracking allocations using the old addresses. The nodes within VF owned area
> - * have to be shifted, and balloon nodes need to be resized to properly mask out
> - * areas not owned by the VF.
> - *
> - * Fixed &xe_ggtt nodes used for tracking allocations:
> + * have to be shifted, and the start offset for GGTT adjusted.
>   *
> - *     |<------ balloon ------>|<- nodes->|<----------- balloon ----------->|
> - *
> - * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
> + * Due to use of GPU profiles, we do not expect the old and new GGTT areas to
>   * overlap; but our node shifting will fix addresses properly regardless.
>   */
>  
>  /**
> - * xe_tile_sriov_vf_fixup_ggtt_nodes_locked - Shift GGTT allocations to match assigned range.
> - * @tile: the &xe_tile struct instance
> - * @shift: the shift value
> + * xe_tile_sriov_vf_init - Init tile specific GGTT configuration.
> + * @tile: the &xe_tile
>   *
> - * Since Global GTT is not virtualized, each VF has an assigned range
> - * within the global space. This range might have changed during migration,
> - * which requires all memory addresses pointing to GGTT to be shifted.
> + * This function is for VF use only.
> + *
> + * Return: 0 on success, negative value on error.
>   */
> -void xe_tile_sriov_vf_fixup_ggtt_nodes_locked(struct xe_tile *tile, s64 shift)
> +int xe_tile_sriov_vf_init(struct xe_tile *tile)
>  {
> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
> +	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
>  
> -	lockdep_assert_held(&ggtt->lock);
> +	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
>  
> -	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
> -	xe_ggtt_shift_nodes_locked(ggtt, shift);
> -	xe_tile_sriov_vf_balloon_ggtt_locked(tile);
> +	return drmm_mutex_init(&tile->xe->drm, &config->ggtt_move_mutex);
>  }
>  
>  /**
> @@ -312,6 +139,7 @@ void xe_tile_sriov_vf_ggtt_store(struct xe_tile *tile, u64 ggtt_size)
>  	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
>  
>  	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> +	lockdep_assert_held(&config->ggtt_move_mutex);
>  
>  	config->ggtt_size = ggtt_size;
>  }
> @@ -345,6 +173,7 @@ void xe_tile_sriov_vf_ggtt_base_store(struct xe_tile *tile, u64 ggtt_base)
>  	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
>  
>  	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> +	lockdep_assert_held(&config->ggtt_move_mutex);
>  
>  	config->ggtt_base = ggtt_base;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> index 749f41504883c..1ca5bc87963f0 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> @@ -10,9 +10,7 @@
>  
>  struct xe_tile;
>  
> -int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
> -void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
> -void xe_tile_sriov_vf_fixup_ggtt_nodes_locked(struct xe_tile *tile, s64 shift);
> +int xe_tile_sriov_vf_init(struct xe_tile *tile);
>  u64 xe_tile_sriov_vf_ggtt(struct xe_tile *tile);
>  void xe_tile_sriov_vf_ggtt_store(struct xe_tile *tile, u64 ggtt_size);
>  u64 xe_tile_sriov_vf_ggtt_base(struct xe_tile *tile);
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> index 4807ca51614cf..2cbbc51c101d4 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> @@ -7,11 +7,15 @@
>  #define _XE_TILE_SRIOV_VF_TYPES_H_
>  
>  #include <linux/types.h>
> +#include <linux/mutex.h>
>  
>  /**
>   * struct xe_tile_sriov_vf_selfconfig - VF configuration data.
>   */
>  struct xe_tile_sriov_vf_selfconfig {
> +	/** @ggtt_move_mutex: Prevents multiple movements from happening in parallel */
> +	struct mutex ggtt_move_mutex;

a) if we correctly get GGTT only from primary GT, then there should be no parallel updates ever
b) if still needed maybe make this mutex more generic to protect all tile-level VF config
or even make it top-level to protect all VF config ?

> +
>  	/** @ggtt_base: assigned base offset of the GGTT region. */
>  	u64 ggtt_base;
>  	/** @ggtt_size: assigned size of the GGTT region. */

