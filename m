Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E28C61CE8
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 16:27:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B97610E3F6;
	Mon,  9 Jun 2025 16:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VV2J65/i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993DC10E3F6
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 16:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749486462; x=1781022462;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5Rwr7pNsAdX/m+QGqL/DZtdA6uQeuyr3/1ZDvgmhcYs=;
 b=VV2J65/iGtG/GRNfdEtEvGsFBZ1utGHy39Z9ufhB3QKBx+2x033UP0d7
 Ri4YEvvb4t0V8BnqGUYf/D7buKkWaDu2aOevdPVSC4gxxlVJg5/BnN2vh
 E/zVonXjFhNuGPVF6kqkf9ILtKFKVYEHtv9IO/raZQehn0hlfUXasCsLP
 eBc2O7+5LqYVX2u/FB1ay3kmSy/1UludPhvv/4xU106Aj45DvL7VDRzn1
 KHLEa3BMs3LeSULqF51RUUrqRD+bj4kMc96nc3ZhLY62FmWhF7NKUuC4m
 Z8EQiJCkb3Wq9ME1Dgvmf253pqxh11ilBVYB3HkYsxzpSHnu0shLtsSQ3 A==;
X-CSE-ConnectionGUID: PCZb0sB1Ss2yCB9j3WMcvw==
X-CSE-MsgGUID: WH8/XTWkTgGa6ztX4CHwLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51277370"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="51277370"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 09:27:41 -0700
X-CSE-ConnectionGUID: Z5usgHHgR1KDBWOi2CugQQ==
X-CSE-MsgGUID: HvhMs1suTPaFf6T9edS1hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="147080191"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 09:27:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 09:27:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 09:27:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.70) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 09:27:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1gV9sFySjc0weEkGcUFqAWJ/W8LK+sYM5UM/zqNiO/yQ1weUzLRvHo8TZ/+a0UDVfeMLuGqv//vJuvVHLblhaTmN5WP2IsRZzLnEBgyLfZmEFM6iYFFtiOrrtRoV9045ifSYBb+8B6D/B8kpgtKj9zLw2gGbiXUcx/9dGjFaH/x/HLtNpmwj30xvRsNZh1+I4DhjrwOQ4MD84nFyKR84jtUAllmYRhfeUZ1m/92rksH7+3+0ornVl94gX7dmmj4bmnXqpY1LOYnUC+zT74zj9WUTrXcKPtvoFrN/a1rigdSBl3BaTBKxugAqpnpX81O8PGMJIQJF1gmTOW/v2moQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zhBBOxXnMyOhJ0nRH/9vyFKSWrh14wSVUFLohOpq6M=;
 b=HMTtHbFjTF/0B4xC7kA9CLdNLWBxF/AumBQ8zoFHFKDFyqChsN7NxQ8Cdga1vVrz9qvCr3nJSpEnybilptIFdGlCO9oZEJN3A5/aLFPNFxruaePc3kvTxE3gp84CKe1W4lLGkT9v595OgGkgv0GZ+iz5zAw8R6MfbeVYgqOVHT7YiriK7IOQwQnYkoQen3N2qHIbvnS6cXJEfqhsKtFpK3NY+bAA42DalVGqlCobWmjvQ2oexklBKvXZqU53lClcWSQwboAok8WWWB/5rOnSsGNDMVSltTr8xZDUaX1SKH2WMP6AadYJyzYwi7kKUWvMKG8OrMS2TBqOo3TblGOHNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8696.namprd11.prod.outlook.com (2603:10b6:408:216::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Mon, 9 Jun
 2025 16:27:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8813.020; Mon, 9 Jun 2025
 16:27:21 +0000
Date: Mon, 9 Jun 2025 09:28:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Tomasz Lis <tomasz.lis@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v6 3/3] drm/xe/vf: Register CCS read/write contexts with
 Guc
Message-ID: <aEcLyHdJod53eb7v@lstrano-desk.jf.intel.com>
References: <20250606124558.30966-1-satyanarayana.k.v.p@intel.com>
 <20250606124558.30966-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606124558.30966-4-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR04CA0346.namprd04.prod.outlook.com
 (2603:10b6:303:8a::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8696:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c98d050-31d1-4b9a-b481-08dda77282a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGhyK0NPYUR0cDhNRVFoYkh5dVc1TDBaTzRqZWs2aytyVHNWOHU2Nitldm5x?=
 =?utf-8?B?dFNvU1BlM3RYb0NFQjBPNndObnVBUktCcTlEd2VzQ2ovK2FtYkozdjBoVDJ2?=
 =?utf-8?B?dHcvVWNIZTY5ZXh3QkZiUXNNWjY2QU0zSThENnBIMjlVWjBZcS9ad3RSSjFO?=
 =?utf-8?B?VUhpbXZ5YjJoK25RWXV3QXFyTm1vc3c2ZFVldGhQbjBwQWVHemsvd1I1OVpW?=
 =?utf-8?B?eHVzdGVhc25jQnVYNFBsYnpMM2YzV2k2akRBSFVDU0FoMUovNmY1dVRkSkor?=
 =?utf-8?B?RmVYT3ZEbHFiQUQvMGVsam1wU0xpMWJ5K1JjR21qUWRPbWxRZGJDUjN0c3Fz?=
 =?utf-8?B?T2ZrVmRqMWluVXlGV1hjSTVtaXdnbngzSENoMW1uOFJXZ3pZWUp5WDJjZUJz?=
 =?utf-8?B?YmtQVUpQSnBJcWJleTE4RjFXQS9ObkxhOC9FVkR5anBEdURjNjhXYVc1VkdY?=
 =?utf-8?B?bWxuMkMxVXpaN0VidjVGTGZFNGkvV3E0QXBGVWpnTU0xZUtVZzdjR3M3NVRu?=
 =?utf-8?B?TWdaL2NZbmpUUGhnWVZkcGdXK01JR3l2NVFyQll3V1NtMkI3RFh1Zy91STBx?=
 =?utf-8?B?Vm15bDV4bFJ2Tmw4RmJtOGtpbHRCYW5XMWExMExuNmJwdXlnd2syUWtCOWlM?=
 =?utf-8?B?aU9Wa3FsUVQ2RjRhWjZ5SlBKK0JUMHBDUS9nNHJNY1RPMXVSUEFUSG1SSmF0?=
 =?utf-8?B?OVV0dklBSVFlK3o1dXdRNVBWVXd2cUkxc3hPQjMvc3hDM3pDcCtVMjVxc2dm?=
 =?utf-8?B?QlBZQVhxYkVPcG9CSW5xUVJTd2k0c2N1TTR6UzNDaGNmVWNxVzZ2UHZZTldY?=
 =?utf-8?B?QzJFNFovc3d5Vk0ySUk4TnBBTzJ5ZkczbjhDSjY1RldUZmZjVzVrSExZZEx3?=
 =?utf-8?B?THB5SjdhSE9lZ2xlS0JTRldYTzh1SWdwL0RuWWRIclV3Q29aWERObUNTTGVC?=
 =?utf-8?B?U2NLWTRDMmJaeG0wNlRNSGFPZ0MzekZoNWF4a2d6RVhtMHlkS2F3OXBEemRS?=
 =?utf-8?B?MUE1YnNML3c2RjJ1UVJTUDVOVGhWMWZiQUNrbndtUG0rcjdCRkJKS3J2Nk9j?=
 =?utf-8?B?Yi9jbVZ6eXRBTHE4V3l4UjZtcnF1L1JZZkdxQXFxMHBXK2hyTWFmR0NMcm5r?=
 =?utf-8?B?VlNrdHMzd0JkNzFCU0JJUkN2bmo1eWFwNlhXdm5CL1d0RmMrLzMzbWVwKzBD?=
 =?utf-8?B?c200eVIveDNMcTA4bFhGU3h0K2dxMm1RcVczVjJkcDd3L3pHNzV1QnM4V1N5?=
 =?utf-8?B?K0RYMDdpS3F2dmd1b3dIVk5jYkVIVXV5ZTlMOHV4Q1drQWovMkQ4aWh6alZY?=
 =?utf-8?B?TGZXQTJDbmtMNm9pYWRDVFdBZEYzTU85ZENlMzFHcUJPZ3g1T0pRQkhTM05L?=
 =?utf-8?B?NnhmNk5QcEtNUndUaUIxM0tTOXRDRWkzVjJTc05hRkNUOGZzU3lSem85ekRE?=
 =?utf-8?B?M2xrNE9OWFpJUDVnNkQ2OUNCNmpzK0NlYUpPNEU5SmY3a0FsSWx3MXlVa1Iy?=
 =?utf-8?B?WXFhWTN2bXBQSUhGN1NEUFZPV291TjN0ZGFETlEzRmE4UUlEYThVMlBpb01X?=
 =?utf-8?B?NndURWljNFU0Yi9zQy9hN291M0xTUlYrWG5wb1RzUWJacDhVS3dNNG1wbHBX?=
 =?utf-8?B?ZzhCZTBNK0hESEZOWVV3UnhRNEZaaVJDNWZvQ2NEaVE3OWNsU3VYUUdHanBJ?=
 =?utf-8?B?V2gwQ1gxNGdLQjZ6cFRWY0dsWWJid2wzVi9hV1l1cHorR295NjBlQmxsdW5P?=
 =?utf-8?B?NEhCUlhnankraktkcmxQZzZmaW1NMEQ0VS9Idmw0Q1JhVk5tQmdsK1ljMFZP?=
 =?utf-8?B?bWh4U1ErQ1lLaE1MZk9oWEZqZGRXVXNtTHZTZ05lK1FiV3pHREUxZDFhaEhT?=
 =?utf-8?B?VjZ4YUFZVithQ1dlbmo1UEE2U3VveTNQMW9xSTMvUGNES0NaR0hTNTB6Z1NW?=
 =?utf-8?Q?S+fJkVkoJfQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVEzM2puaDhGU0p4R3RpaldOalNHV1A0SFNQU3lmRk13bmdheXlnMlV3QlRj?=
 =?utf-8?B?SVhsZC9YSENFdG9uUW5oTitGTlkrcWZNVTZVZHZFYkZxdTJpUzI2cENOQ1JZ?=
 =?utf-8?B?clFpeVlDUS9PODg1TDVMdjAzNkdNTzBOYWNEV3pndU9admFpM1pIQ3VrNUp2?=
 =?utf-8?B?UVQ0RmYxZGdmRktYeGhzUzQzSDl2M1dHU3MyS2RtcENreVo2NVRTU3dyT005?=
 =?utf-8?B?bkV1d0Z0VUU2SlM1ZDZKQ1ZVZm9jbk96d0t6SFUxYnk0RUJudWhBZ0ZTSU9I?=
 =?utf-8?B?UFdXT3ZEbTlNaUlKQzFCTDI2MjRKVFF5RWVKaTBNMmNUemJXdXNDUHBnL1o0?=
 =?utf-8?B?bWtrS21sV1BIaTUvdk9HOGwxanJwRWJQNXdKVEJ2R0VYRlhJZFVPVGJybnJ3?=
 =?utf-8?B?MWUyWFhKVTRnbHhuMlBxSlZCSVFtVU4vZUVVb2pjR0JDa09xREtwY25LYnVV?=
 =?utf-8?B?MXZFNGxUZkNHelgvQzlHdmhCdVRnN1QzRDJFeFdlQnB6R3FZQWZPV3F6TVc2?=
 =?utf-8?B?ZVI5ZzJKRkdHQVBlMzN6ZERWV0FydGtTM0dBY1VFWDE1ajEwU1lWSjVlWG0r?=
 =?utf-8?B?TkFQQUpBZEx5d0QzTTJ4MVpqc3dFaU5wdGE4a25Yck40ZEFsa0hybEh6ZEFR?=
 =?utf-8?B?QnQ3OFRnZ24rZ3RJUDF5SFl4UXUraWs5TTNDbERvK1pyY3Y0SE9SUklVR2ow?=
 =?utf-8?B?SjM1V1JKTm1sbTgrV2hHSFFVSEg5M1E0UTF5OEpsNWl2MDdJNUdtYVNiOTNl?=
 =?utf-8?B?VFdTQjJRR2pHb3RUbEdlYnA3eXFZR0NXZGtMK3lGS0hrM3MzdHdDMWR3RXZP?=
 =?utf-8?B?bmlIZlZFL09PWjFhVjBVTmpZS1k5SVVnMHVqMXF0OEJocVY0QXQ4TUVWK21h?=
 =?utf-8?B?YXFCaVhUeWxyQkRFYWdTK2VLY1Q2ZktiNmxwa1RpUzBtSzF4Z1BKYy9DOXRr?=
 =?utf-8?B?bW9kSkRidmVyNmJ6TkJ0cUptWVBiVTVlbzdKNSt3blg4UWFjZENmUmZIdHk2?=
 =?utf-8?B?akFtUm1ycFQ3N1lKdXI0bXFZZFRsMmdHamtlN2ZqNEhGL1M3Zk9kajkyaXFR?=
 =?utf-8?B?Wk9BZ25SbTVsd2o1aWhBZ25ZNEJ1S0ZCeldGSDB4MnhseXR6TmZEbkVIM21N?=
 =?utf-8?B?S1VMWDBDc3IzMnRUVkN4ZDByeno1bXd2eDNOKzdCaWpRUmdYQWV2NzA2b3dI?=
 =?utf-8?B?amU2MWMrRjBENE0yYjBHOTZCRDVKWjRiN21Mb1FySzA4OURFZVovRkw1QXVz?=
 =?utf-8?B?eHZ0M2RqMjdYN2R5K2xJN0tNUjBONHJEaENVazFiL0t1VUxMM1ZDVVlpMFFy?=
 =?utf-8?B?SEVwSTc4d21ZdUVLL2dibGpTblRZYWd5bGdNZmNJZC81V1RCeWVuVW5CQ0wx?=
 =?utf-8?B?STVEUEZaMjFiS1dtdmo1ZFlUb0NCRlk0M1lINnJWVGdRaEtaTnM1bHdWWG9v?=
 =?utf-8?B?UTlpeSsraXh3ZFlLOWEwY0hWYTlBdS9iVHYzR3VYYUhPc1hLcHZqRHZHekFT?=
 =?utf-8?B?TGgyU3pmQW8zM2U0YzhUbFhsTmluZ2RBK1RKMjl3a3paMmdHd1FhNU9aNTBB?=
 =?utf-8?B?VkpXM1lVMHcxaDJIWE5remlBbDE5Q2duUVk3LytBMWZ0Wm0rUU43VUVodWUw?=
 =?utf-8?B?NWVDcXoyeUFMQm9vaXBwRjVDQnEyV3g0UWNZZHZFRzY3d256Rnc0WTBydEJF?=
 =?utf-8?B?T0JHUDhYbVFDcGxNaEtKcTFUbmVZR2ZBS3dMQXRUZ2tiZk1Fa2ovZTMxTmRF?=
 =?utf-8?B?M1ZuQU5LZytUOHdFRGV1WlAzNmFFMnJYZDVrc2hIS052QUpWZmFqSUcvYncr?=
 =?utf-8?B?eEN4S2E5ZFVSN3pEMzJDR1dscklIL3ExS3RVcFlpNGIvMWtKWjVZU3lLdkg2?=
 =?utf-8?B?L0tMaTJGMHFUR3lKNnlmblBDY1hlV1pJRVpEMmZRaElKUUpRUTJCNUQzTkVn?=
 =?utf-8?B?YXMvc2ZmaEZlZnlpRDZvejZYa2lnK2pVa2NPc3NhR0hkcVpYc1F3RnRqbWl4?=
 =?utf-8?B?dzhLR2hGcmlObGpXQVgzN3FVUFJ0VWZvaGE0bVpBdGgySHlVVlJ0UncvZXFX?=
 =?utf-8?B?UU15TG1Ec2VKUWVsRWRwQjYyT3h4dTEyZ2J1OFdMa1lYUEhYTkM2QkFUT21l?=
 =?utf-8?B?TitZSGRSTkVEVndTb0Yza2dBQlphS1c4RFRONE44ZFNyUUs1S29DMDNzRmQ0?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c98d050-31d1-4b9a-b481-08dda77282a7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 16:27:21.8181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhTzCZZO9jFf+rKLGTX6DOKjAH66YhHrFxBnmZ8rypkVbLc2xCDcboqF4PH1e29pAXHpiR5g83/JadeXgMHHqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8696
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

On Fri, Jun 06, 2025 at 06:15:58PM +0530, Satyanarayana K V P wrote:
> Register read write contexts with newly added flags with GUC and
> enable the context immediately after registration.
> Re-register the context with Guc when resuming from runtime suspend as
> soft reset is applied to Guc during xe_pm_runtime_resume().
> Make Ring head=tail while unbinding device to avoid issues with VF pause
> after device is unbinded.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> 
> V5 -> V6:
> - None
> 
> V4 -> V5:
> - Fixed review comments (Matthew Brost).
> 
> V3 -> V4:
> - Fixed issues reported by patchworks.
> 
> V2 -> V3:
> - Made xe_migrate structure private as per review comments.
> - Created new xe_migrate functions to get lrc and exec_queue.
> 
> V1 -> V2:
> - Fixed review comments.
> ---
>  drivers/gpu/drm/xe/xe_guc_fwif.h     |  5 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c   | 37 +++++++++++-
>  drivers/gpu/drm/xe/xe_guc_submit.h   |  1 +
>  drivers/gpu/drm/xe/xe_migrate.c      | 22 +++++++
>  drivers/gpu/drm/xe/xe_migrate.h      |  3 +
>  drivers/gpu/drm/xe/xe_pm.c           |  4 ++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 89 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
>  8 files changed, 160 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 6f57578b07cb..71a5208d0316 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -45,6 +45,11 @@
>  #define GUC_MAX_ENGINE_CLASSES		16
>  #define GUC_MAX_INSTANCES_PER_CLASS	32
>  
> +#define GUC_CONTEXT_NORMAL			0
> +#define GUC_CONTEXT_COMPRESSION_SAVE		1
> +#define GUC_CONTEXT_COMPRESSION_RESTORE	2
> +#define GUC_CONTEXT_MAX_TYPES			(GUC_CONTEXT_COMPRESSION_RESTORE + 1)

s/GUC_CONTEXT_MAX_TYPES/GUC_CONTEXT_COUNT

> +
>  /* Helper for context registration H2G */
>  struct guc_ctxt_registration_info {
>  	u32 flags;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 80f748baad3f..4e1423b0f07c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -531,7 +531,7 @@ static void __register_exec_queue(struct xe_guc *guc,
>  	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>  }
>  
> -static void register_exec_queue(struct xe_exec_queue *q)
> +static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
>  	struct xe_device *xe = guc_to_xe(guc);
> @@ -539,6 +539,7 @@ static void register_exec_queue(struct xe_exec_queue *q)
>  	struct guc_ctxt_registration_info info;
>  
>  	xe_gt_assert(guc_to_gt(guc), !exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), ctx_type < GUC_CONTEXT_MAX_TYPES);
>  
>  	memset(&info, 0, sizeof(info));
>  	info.context_idx = q->guc->id;
> @@ -548,6 +549,9 @@ static void register_exec_queue(struct xe_exec_queue *q)
>  	info.hwlrca_hi = upper_32_bits(xe_lrc_descriptor(lrc));
>  	info.flags = CONTEXT_REGISTRATION_FLAG_KMD;
>  
> +	if (ctx_type != GUC_CONTEXT_NORMAL)
> +		info.flags |= BIT(ctx_type);
> +
>  	if (xe_exec_queue_is_parallel(q)) {
>  		u64 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
>  		struct iosys_map map = xe_lrc_parallel_map(lrc);
> @@ -750,7 +754,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  
>  	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
>  		if (!exec_queue_registered(q))
> -			register_exec_queue(q);
> +			register_exec_queue(q, GUC_CONTEXT_NORMAL);
>  		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
>  			q->ring_ops->emit_job(job);
>  		submit_exec_queue(q);
> @@ -2347,6 +2351,35 @@ static void guc_exec_queue_print(struct xe_exec_queue *q, struct drm_printer *p)
>  	xe_guc_exec_queue_snapshot_free(snapshot);
>  }
>  
> +/**
> + * xe_guc_register_exec_queue - Register exec queue for a given context type.
> + * @q - Execution queue
> + * @ctx_type - Type of the context
> + *
> + * This function registers the execution queue with the guc. Special context
> + * types like GUC_CONTEXT_COMPRESSION_SAVE and GUC_CONTEXT_COMPRESSION_RESTORE
> + * are only applicable for IGPU and in the VF.
> + * Submits the execution queue to GUC after registering it.
> + *
> + * Returns - Success or asserts.

It always returns 0, so maybe just convert to void return.

> + */
> +int xe_guc_register_exec_queue(struct xe_exec_queue *q, int ctx_type)
> +{
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	if (ctx_type != GUC_CONTEXT_NORMAL) {

I wouldn't expose this for GUC_CONTEXT_NORMAL as there is not a current
user and registering normal user contexts would like mess with internal
state machine / expose races.

If we want to expose this for normal queues, I think we'd need to think
it through more so best to disallow this or assert it is not normal.

> +		xe_assert(xe, IS_SRIOV_VF(xe) || !IS_DGFX(xe));
> +		xe_assert(xe, (ctx_type > GUC_CONTEXT_NORMAL &&
> +			       ctx_type < GUC_CONTEXT_MAX_TYPES));
> +	}
> +
> +	register_exec_queue(q, ctx_type);
> +	enable_scheduling(q);

I didn't see a reply to my question regarding if enabling scheduling is
required. Please follow up and answer.

> +
> +	return 0;
> +}
> +
>  /**
>   * xe_guc_submit_print - GuC Submit Print.
>   * @guc: GuC.
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 9b71a986c6ca..f1a26d498339 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -39,5 +39,6 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
>  void
>  xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapshot);
>  void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
> +int xe_guc_register_exec_queue(struct xe_exec_queue *q, int ctx_type);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index d7f3009260ee..dbc1bbfc944f 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1038,6 +1038,28 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
>  	return err;
>  }
>  
> +/**
> + * xe_get_migrate_lrc() - Get the LRC from migrate context.
> + * @migrate: Migrate context.
> + *
> + * Return: Pointer to LRC on success, error on failure
> + */
> +struct xe_lrc *xe_migrate_get_lrc(struct xe_migrate *migrate)
> +{
> +	return migrate->q->lrc[0];
> +}

s/xe_migrate_get_lrc/xe_migrate_lrc/

'get' generally implies a ref is taken.

> +
> +/**
> + * xe_get_migrate_exec_queue() - Get the execution queue from migrate context.
> + * @migrate: Migrate context.
> + *
> + * Return: Pointer to execution queue on success, error on failure
> + */
> +struct xe_exec_queue *xe_migrate_get_exec_queue(struct xe_migrate *migrate)
> +{
> +	return migrate->q;
> +}


s/xe_migrate_get_exec_queue/xe_migrate_exec_queue/

Maybe drop xe_tile_migrate_exec_queue too and use this new function.

> +
>  static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  				 u32 size, u32 pitch)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index ab5ebb44d2c9..016747916c31 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -116,6 +116,9 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
>  			   struct xe_bo *src_bo,
>  			   int read_write);
>  
> +struct xe_lrc *xe_migrate_get_lrc(struct xe_migrate *migrate);
> +struct xe_exec_queue *xe_migrate_get_exec_queue(struct xe_migrate *migrate);
> +
>  int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  			     unsigned long offset, void *buf, int len,
>  			     int write);
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index f64ebd7b854a..a47539ce98eb 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -22,6 +22,7 @@
>  #include "xe_irq.h"
>  #include "xe_pcode.h"
>  #include "xe_pxp.h"
> +#include "xe_sriov_vf_ccs.h"
>  #include "xe_trace.h"
>  #include "xe_wa.h"
>  
> @@ -546,6 +547,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  
>  	xe_pxp_pm_resume(xe->pxp);
>  
> +	if (IS_SRIOV_VF(xe))
> +		xe_sriov_vf_ccs_register_context(xe);
> +
>  out:
>  	xe_rpm_lockmap_release(xe);
>  	xe_pm_write_callback_task(xe, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 4b5cfc0d421b..9afb652f6299 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -8,6 +8,9 @@
>  #include "xe_bb.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_exec_queue_types.h"
> +#include "xe_guc_submit.h"
> +#include "xe_lrc.h"
>  #include "xe_migrate.h"
>  #include "xe_sa.h"
>  #include "xe_sriov_printk.h"
> @@ -140,6 +143,82 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
>  	return 0;
>  }
>  
> +static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
> +{
> +	struct xe_lrc *lrc = xe_migrate_get_lrc(ctx->migrate);
> +	u32 addr = ctx->mem.ccs_bb_pool->gpu_addr;
> +	u32 dw[10], i = 0;
> +
> +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;

See my lastest reply to patch #1 about a single BB vs. a list.

You are disabling preemption here, so if save / restore queue is
timesliced, this will explode in the GuC (i.e. it will likely run longer
that preemption timeout period and trigger an engine reset).

If the save / restore queue is not timesliced, then multiple BB for BOs
is useless.

Please follow on my comments in patch #1 and pick one the options laid
out.

> +	dw[i++] = MI_BATCH_BUFFER_START | XE_INSTR_NUM_DW(3);
> +	dw[i++] = addr;
> +	dw[i++] = 0;
> +	dw[i++] = MI_NOOP;
> +
> +	xe_lrc_write_ring(lrc, dw, i * sizeof(u32));
> +}
> +
> +static int register_save_restore_context(struct xe_migrate *m, int ctx_id)
> +{
> +	int err = -EINVAL;
> +	int ctx_type;
> +
> +	switch (ctx_id) {
> +	case XE_SRIOV_VF_CCS_READ_CTX:
> +		ctx_type = GUC_CONTEXT_COMPRESSION_SAVE;
> +		break;
> +	case XE_SRIOV_VF_CCS_WRITE_CTX:
> +		ctx_type = GUC_CONTEXT_COMPRESSION_RESTORE;
> +		break;
> +	default:
> +		return err;
> +	}
> +
> +	err = xe_guc_register_exec_queue(xe_migrate_get_exec_queue(m), ctx_type);
> +	return err;
> +}
> +
> +/**
> + * xe_sriov_vf_ccs_register_context - Register read/write contexts with guc.
> + * @xe: the &xe_device to register contexts on.
> + *
> + * This function registers read and write contexts with Guc. Re-registration
> + * is needed whenever resuming from pm runtime suspend.
> + *
> + * Return: 0 on success. Negative error code on failure.
> + */
> +int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
> +{
> +	struct xe_tile_vf_ccs *ctx;
> +	struct xe_tile *tile;
> +	int tile_id, ctx_id;
> +	int err;
> +
> +	if (!IS_VF_CCS_READY(xe))
> +		return 0;
> +
> +	for_each_tile(tile, xe, tile_id) {
> +		for_each_ccs_rw_ctx(ctx_id) {
> +			ctx = &tile->sriov.vf.ccs[ctx_id];
> +			err = register_save_restore_context(ctx->migrate, ctx_id);

if (err)
	return err;

Matt

> +		}
> +	}
> +
> +	return err;
> +}
> +
> +static void xe_sriov_vf_ccs_fini(void *arg)
> +{
> +	struct xe_tile_vf_ccs *ctx = arg;
> +	struct xe_lrc *lrc = xe_migrate_get_lrc(ctx->migrate);
> +
> +	/*
> +	 * Make TAIL = HEAD in the ring so that no issues are seen if Guc
> +	 * submits this context to HW on VF pause after unbinding device.
> +	 */
> +	xe_lrc_set_ring_tail(lrc, xe_lrc_ring_head(lrc));
> +}
> +
>  /**
>   * xe_sriov_vf_ccs_init - Setup LRCA for save & restore.
>   * @xe: the &xe_device to start recovery on
> @@ -175,6 +254,16 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  			err = alloc_bb_pool(tile, ctx);
>  			if (err)
>  				goto err_ret;
> +
> +			ccs_rw_update_ring(ctx);
> +
> +			err = register_save_restore_context(migrate, ctx_id);
> +			if (err)
> +				goto err_ret;
> +
> +			err = devm_add_action_or_reset(xe->drm.dev,
> +						       xe_sriov_vf_ccs_fini,
> +						       ctx);
>  		}
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> index 5d5e4bd25904..1f1baf685fec 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -12,5 +12,6 @@ struct xe_bo;
>  int xe_sriov_vf_ccs_init(struct xe_device *xe);
>  int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
>  int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
> +int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
>  
>  #endif
> -- 
> 2.43.0
> 
