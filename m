Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653DFE6F072
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 08:44:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CC310E09B;
	Tue, 23 Dec 2025 08:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cf2OFWCC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E0510E09B
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Dec 2025 08:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766479478; x=1798015478;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iF1PfrvVJvZbiE/Cytzz1Ou0++lV4F6cwQIvYWyhp3M=;
 b=Cf2OFWCCg5e19PbzQ/awg4SUA90gxGcbXPg8AMr8QSEDutRzKgRTQ4cH
 fTAPctTS4575blICehig0HS8URNZft+vaeB6szQLtLopFWfb6+cRQpPyv
 LgVt1l7BTzWPnEknBqD1l4hJHqIw4XJgeJj99S17F3rUFlKHBuFg19QET
 REUObeYd3ZA44PKUD6CPbI6gTTwbnww/CcW2HX/Utk6ILznhx1gNtP9Zd
 IFnXvzGr20CL64W3ZmegLw/MVyShWXXJ5fNSlXKRpfxyMpWi0eh3ped8/
 eFuI0snd0V70YnCI7v2z7kcvCYsg/qVEYhHYUISn8fy0HzJwFYMdKK3WB w==;
X-CSE-ConnectionGUID: sPd3PKCKQFCzGyNllKLumw==
X-CSE-MsgGUID: 2QEhGdmUQ52tt5RtP9BMJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79048344"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; d="scan'208";a="79048344"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 00:44:36 -0800
X-CSE-ConnectionGUID: dYsLQBrSRoyLAjZuaKhuOg==
X-CSE-MsgGUID: AkMUISSoSIW4m8+KqnI/IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; d="scan'208";a="198975745"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 00:44:36 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 00:44:35 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 23 Dec 2025 00:44:35 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 00:44:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wR447bk1RAcPA4kW/X6faxGYbz5Vm3lxzCGAjU4+5noNU542Hkoj1fZ09ciD4E9PnmU3UeE0EzCzAPn7u4sa78FCXDcIKQQ+5YoAw65blFXU8xdZRj3V7i2O33s1NC5gZ4CKWaqgrUxkISjK9fq4eCp8Ent1HA0o0G8zybVZh8MOUiPRe4X7/Xxe5FvH/+e30JrAH+0jhMZ/qyqP+S8VgIkFpbYZScEgW4GJM8lPVWlPhdbycVUdYaXTnHJdpBdE2eHCHJb33iTR3qkB432gddS1ruWQNYOneb11Y/dJPspCIgOWtt8B/XbvcsuULm+2DgkpUVayyyMa1+2DMYVPag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwoS+3S+ogTXGoiQoJ3A91oKLY9VvVP42YyLaDaTOfQ=;
 b=diwZ5OS5j5hVcTzEXyplmfAX/UJVd/zjsNPTW4evUAWBVLG81q69gOduRnNY70gdNoJOK75LHeY6XYYu9DZrNUH5x3GFl5+yaRaWr/s3JwvbLv4kTzkwoRlW61PU8jSAS02BPlVWkmuDEE33orPOemaSRjufWjduzUKZq3RKh728wX+uYKVAo7Ozcy//r/a1w15o5KJQbvZTJKquD1R3rsfmzz8A0yKOmQV9jIxHQ0imUs19cJtsyoEy3+PaYyemxhD4TETSzlenSiZ0aShnM+I9lHocFZ9Tanq+TgzB1KGo3Gvr7V1y83L52OzfMZEWAzWSXPRsNlHxOz0LJ5rXZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SJ5PPF0DADD6EFE.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::80d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 08:44:33 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%4]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 08:44:33 +0000
Message-ID: <a0dc811d-0890-4ca5-8325-6eb296411054@intel.com>
Date: Tue, 23 Dec 2025 00:44:31 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe: Decouple GuC RC code from xe_guc_pc
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251218015340.3800280-1-vinay.belgaumkar@intel.com>
 <20251218015340.3800280-2-vinay.belgaumkar@intel.com>
 <a981d6fd-09b1-43d4-9797-e1ce0fda2ba4@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <a981d6fd-09b1-43d4-9797-e1ce0fda2ba4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0039.namprd04.prod.outlook.com
 (2603:10b6:303:6a::14) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SJ5PPF0DADD6EFE:EE_
X-MS-Office365-Filtering-Correlation-Id: b842a27d-f1d6-4bc5-8f4f-08de41ff7e79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzQvNXRnTUNmcEVoQXk2K3ZrQlpDd2NOb3VpVC9aTTVIdjd4SWhRd0RSUzJD?=
 =?utf-8?B?SUVicUhOWVNyWG9XdHFLREthWmphcnhEbHcxakdQekZhU01Fa1E5am5XWEJo?=
 =?utf-8?B?dktmYnI2RnJ0ajQ3V0JkVlR2ZjBhZDdKWnhpNDZVVXcweUZXS3VBSCt5UFRZ?=
 =?utf-8?B?cXhlTC9HbTJFN3NCeWE1Uk10b3JXeXVWdU5uUTlFNnZ3QllBcjlxM2h0alRS?=
 =?utf-8?B?dkltcWc4NUFOeXQrVERIV3BVTWp0bysrSjVzaE9HNGQ3VGFqNG5NUFoyZE1U?=
 =?utf-8?B?Nmc3dEZEV3NNSjNYb1BwTFg2VzdhMUd2dnN6U1I1TkgzOXZDQ0t5OUJuOHA0?=
 =?utf-8?B?SGt2aDRFZU5wbi9qYVFsak9kT2R5dE13OWFrNW5Tc3FiL3JQSlpWNkNlZy9v?=
 =?utf-8?B?STBLdmxEeXFrcDRXcmVlV25SekJVcmdKblZ3L1pBZFVUc245cDFwR3ZaNUNn?=
 =?utf-8?B?WnQrMEZ2bGpSb1BxdE00a1VKNCs1V2t6cDdCbnRMQXN0N2pkaTRGQ1VzeFc1?=
 =?utf-8?B?TmJZK1ZHUXBKRHNUbnI0MUlVeU1KdTdhdVNJQkpUeU9aYzVPOFNCM2Vwc3lU?=
 =?utf-8?B?cnFyTS9jY1o2MTFZWVF1Tk5UbTVWTTdGVXlWRTMrVElQeUV5dWQ2N0NwN2hu?=
 =?utf-8?B?dTZKNHI2WVNLVk5mYy9OMUU2alJhNElXWWJsS3diSUZSQXJMellkNklNNjNQ?=
 =?utf-8?B?QXZ1Zm5PcCt1cStzNFcyUThrQmZqRkVFY3d1djE1cVhKcVBJdm9VTkdPL3Ay?=
 =?utf-8?B?ZVBucTgvUjBFZ253MUxCWnhzMmR2bFlwNVVyUlBrSjBUYXN5STZXRGFjM0xw?=
 =?utf-8?B?Sm1iN2pKQnJVN0tzMUxNR2JMR1pTWDBPVHpsaXdpbmpBYVJIbUhaRUJaV3J6?=
 =?utf-8?B?WkFqa3hhUUJ0UzZMNVRPNWtyT1NqRjJUZFZWNjV1OWlrUFZMQnBhTEdTaS8r?=
 =?utf-8?B?T044cWNHY0hTT1dRRHZoTGtxejRtZTRBbGx3TlNLT01KaHNsdVFQRWNXdjZ3?=
 =?utf-8?B?dTkrNWxoRTRTaU9BRHJnNEE3NWtIbVlQbG9WVzVYYXBwVkdZQnlwNENMU1RG?=
 =?utf-8?B?R3BhSVdsa1oxWDQ4V0RNVll0RDhRdnNrUmliOWJ2YkhTUUgzMXFTMVRKNWx4?=
 =?utf-8?B?VGNvekZYQ09lTUdDZFRYRGVodVFJNEtUR2pPYXh0QUk5RXlHR0RGRFNQOVpM?=
 =?utf-8?B?S0dBcTVBUDBseTBCVkNqR21Cem80Nm9WaFFqMmxmUkVsS29lUU5yK3dzSFVt?=
 =?utf-8?B?VmYrdVV2MXVmRWFscGNkRzN5SHRZWHF4dStOdXpLa0cwTGtMdUQvVWFtSVI5?=
 =?utf-8?B?OW5mZjU3Ty9GeE14YWp5T0lwZHlYRE9nK1praThVMWZ1SVlSVXlwanMzdkJR?=
 =?utf-8?B?dURvYnc4eFZlcWxqNHAwMjQySjNwT0c4RHBxNzg1OGpDRVFuTzJCKzQraFQx?=
 =?utf-8?B?T2FyYXV1WlZMKzBOMk1reTFScWpJcldGa1dTVnV3MG5WRGhBaWhFaVNCKy94?=
 =?utf-8?B?em9CNVo3bDJDR1V5YWN6cFFtZi9HUnVsTm1URXZDcSt0TjNiN3U2ejF0Z0Ur?=
 =?utf-8?B?d0VKN3p5L1ZGaVRkRko0U2VhV2ZBVzZVVUxRUk15YUxVWW1peEdSRkluaHhh?=
 =?utf-8?B?QmVtS2tpSnFPeHp0bmZyYjhxZkpvS2FVaXFFWTNlb0lsdWZqUVZVYUl4dkho?=
 =?utf-8?B?QTNHa2pRZVUrWVNWc0c2clNUMS9ReWlXUEpnWmZkVHkrenFWSlVWRWZJVzZq?=
 =?utf-8?B?YjJJVUp3dnRmNnphWG9ZeUVMNFp0aEZJYUJtcjlGRFNuZVB6anBVc0ROM3k5?=
 =?utf-8?B?eVZXdzdIQXpBLzFpUzVvYUEyWW1sU1lIU21KS3EwYmc1enlLY240VGtpQjl5?=
 =?utf-8?B?dzIxdGhGSmxRdjBxaWFtd05hTXo2Vk44M0d0cFdpME9BT0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzM2NUErc3dST2ZBeEE1aXZjZ1JFMjkrWnNkQU4wSG1FcWZ2Ymg3R1hOeEZj?=
 =?utf-8?B?L1hkTmJPNTkzaUxFazgrT0VmYk1jclk2aHJEMUYzdW5MUmZYTVFuSEJHMmw0?=
 =?utf-8?B?OGRmbnBkUndqTUFEeVNBTTV2amJtTlBWK3N3OHZjbzRtc0JFazNWVUh3UEcx?=
 =?utf-8?B?ZFkzREdNb3hmWUJkdHJLSWdzTGtvU0cvR0hBN2xZdG95eFEzK3F6TER1WG1C?=
 =?utf-8?B?dWZweDlqU0w3R0dmdVdaSmF2SWxaRVJkUGtWdGoyWHY5Z2pscU1ESmEvL2JD?=
 =?utf-8?B?L2l4R3BzVEg2OXFEUE1RV3BoRUhpQndSbDY0MWZuWlhkaVd6WGxSaHlBb2pM?=
 =?utf-8?B?TTNtOXZqZlc0c1E3bjBsSEl1K3Rtc3VTR0MvS05ZQmJBODJKbXFCNzFDS2ZC?=
 =?utf-8?B?OEIvNzB3VTZadEgwRUhTamJxYWc0UGZHa1JvWktsWUZPUUdQaHZST1R0NHgv?=
 =?utf-8?B?TmNHQlJlR1o5Z1dtTzBQRHhlbUk0TXl6VkNXVnNodnk4amZsa3BWKzZkZVYx?=
 =?utf-8?B?a3dwclRVeW40aWltWEhOb3BCU0d4Qk9odkkyYUU2S25Za0hVZDViVmRkMnJU?=
 =?utf-8?B?KzM2bGFoTUc2ajVmNWlBcFRmNDB3R1FZb09KemNTV2N5Ukx6V0pmYXgyajRz?=
 =?utf-8?B?TzRlZGdEVm5pNDlDRVBzbEwxREY3cHZEM3dndVYzRjdaS1I2WEhURzJmS1Fl?=
 =?utf-8?B?WlA4TW9LT0xuOUVaU2w5UmV1SUM2WGhPWHNMQldJMzFPVkYwdjZwbkszbE5h?=
 =?utf-8?B?Qk5OSCtBVlltZ1VSeFZtQkkwUGdXV3U5Uy9PL0IrcHlUbm92VzNQK2ZKcG1Y?=
 =?utf-8?B?Y3BYd3p2N3JOK0laS3U0aEk1WERscEFkZWc5c2xLTDFlUkdkcCs4ZU4xV2x1?=
 =?utf-8?B?YVBWNktMT2hNaUJjUXhKcVA3d1NVdTh5WTgxNnFCdndVclFQQmtPMHptcG45?=
 =?utf-8?B?MHhOUDg5Q0VDV1JDWW1JQlErYUtnVFhGbmNSQ2tqM0VqTTM1dlhUU0NKZWtv?=
 =?utf-8?B?dFhwUjFiRmNXMzVBWFVRQk1VUGdHWXlPSlhKTUtpb0dGcnUwcGhDbDFZaFA5?=
 =?utf-8?B?elllMEFMQ0tUYnE5NHBoL3BXVFh6TXg3dGJ0N2RkOTRUR0NaT2F6OGFySlVa?=
 =?utf-8?B?dEUxd1k1UStHRXk4enJkWmgrNHBrdm1HcUd0S0MycXg3SUlhRkFnMDdqZlJv?=
 =?utf-8?B?L2JldlFQclZZRzNEOXd6MytYemU3N0R1T1drajlNVi9ydjFRSXdPWjNHeEhB?=
 =?utf-8?B?K1ZiL1FkV1EwNXhxZWE5YkViM2hKdnVnclJmczdBTjZSdHlBOWRUeTBJWi8z?=
 =?utf-8?B?NFpzRnZCQ2xBQjZ1L1EvSDFXWTA1U2dHTnFIZnoxd1c3ZmwrMWFpTEFNZmIw?=
 =?utf-8?B?TE9sNmJTNWRocEdkdXdVUGRXSWxQQm02ZXVVNDRENVdtV2pPVExjUjZGNXNG?=
 =?utf-8?B?SjJVS01yVWVsampuZzZtc1crWEFseW9jQXhkV1R4MEdTTW1kUHJ1K29FT0hK?=
 =?utf-8?B?K0xPUC93akVxd3VxTXRBT0FhVnhrS0VtYndhVkVNbS9LdUR5aWx1M1VYSE9V?=
 =?utf-8?B?VWp0MEdvRXhzNjV2bjMzTUt5c0lmN1NENFE0LytjSGRnTVVPc3N5N0pkZndN?=
 =?utf-8?B?c2lvV2Q5R0FnYWNQeThiaitlcUZqbU5wY1FZQjBxQ0dmYjhGd2M3TC84YTRF?=
 =?utf-8?B?bG90NHQ3ZGptcXZGVEcyejQ1K1ZTcjJKWmp6ZVhPb2RudUY2cGJkbkYwRFhm?=
 =?utf-8?B?V3VTR2FYWFNPK0ZjY2FydTl2QmoyUW9hM3pZODhJL0xPM2RZMFhuOEcyTUF2?=
 =?utf-8?B?ZFpqV0h1amdqSGM1QlZ2THF6N2xuSDY3MThVa0dvUlNVWlJoUXMzV1JoSDgy?=
 =?utf-8?B?eUM4NVczaGlKQU0wSkJ5b0RrWEpYNTFZS2x5aWFzMHc3bVRJUWkvLzhiRHFm?=
 =?utf-8?B?NUdoUlNiNjRubC85RWRPckxPbWVPR0oyN2VYNTdxZlFESXZ6SlNwRW1NZXZB?=
 =?utf-8?B?TkFUTnQ5dHZlUW5VS0hkcjkraFVQc0ppY1pzdU02SHdKTlR6dVJoS1ltVFRv?=
 =?utf-8?B?ZHpWbit3SGN3WHdDMlJyMCtUL2w2aWRIV210VjArSGorY2YzNkJDNEUrNWs4?=
 =?utf-8?B?TUJSb0dQbU5kak10UUpYeDJUelJsTUF4d2hXQTVWdkNIcmtnN0tmamtQdCtv?=
 =?utf-8?B?dWxPRTBpWmE5bG1veW1PcHhOR2srbUtlR0ZBdGRuRjRHV2MxenhSWWFiMjRj?=
 =?utf-8?B?dHZZaU9NRnJ5S2Y4aVVBQWk4S3Z2U0xtWHFvclN0a0NGbVhBWHpXQkV6eUJy?=
 =?utf-8?B?b3grV0k3VTdBM0RIMHBNYXVCNTJmVk0wNWJjSGpxVko3dmNNeENvblZ2aFBJ?=
 =?utf-8?Q?FPXDeklZ/oJS5mz8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b842a27d-f1d6-4bc5-8f4f-08de41ff7e79
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 08:44:32.9677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HFl7pnZJnSXGJj43qqQtIh9VupcpU6sODHjYF3rGq8fYZfB4GntEIeeYE8dtgp+VKnR9pNXjwfd6heuI9+nu3mOD//BOvzbwktPWg7tiep8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0DADD6EFE
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


On 12/18/2025 1:04 PM, Michal Wajdeczko wrote:
>
> On 12/18/2025 2:53 AM, Vinay Belgaumkar wrote:
>> Move enable/disable GuC RC logic into the new file. This will
>> allow us to independently enable/disable GuC RC and not rely
>> on SLPC related functions. GuC already provides separate H2G
>> interfaces to setup GuC RC and SLPC.
>>
>> v2: Comments (Michal W), remove duplicate c6_enable calls from
>> xe_guc_pc.
>>
>> v3: Clarify crosss interactions between xe_guc_rc and xe_guc_pc (Michal W)
> nit: change log could be under ---
>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile    |   1 +
>>   drivers/gpu/drm/xe/xe_guc.c    |   5 ++
>>   drivers/gpu/drm/xe/xe_guc_pc.c |  70 +++--------------
>>   drivers/gpu/drm/xe/xe_guc_pc.h |   1 -
>>   drivers/gpu/drm/xe/xe_guc_rc.c | 138 +++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_rc.h |  20 +++++
>>   drivers/gpu/drm/xe/xe_uc.c     |   8 +-
>>   7 files changed, 182 insertions(+), 61 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 6ecba27d85f7..90f86ad11498 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -74,6 +74,7 @@ xe-y += xe_bb.o \
>>   	xe_guc_log.o \
>>   	xe_guc_pagefault.o \
>>   	xe_guc_pc.o \
>> +	xe_guc_rc.o \
>>   	xe_guc_submit.o \
>>   	xe_guc_tlb_inval.o \
>>   	xe_heci_gsc.o \
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index f0407bab9a0c..d05380893f39 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -35,6 +35,7 @@
>>   #include "xe_guc_klv_helpers.h"
>>   #include "xe_guc_log.h"
>>   #include "xe_guc_pc.h"
>> +#include "xe_guc_rc.h"
>>   #include "xe_guc_relay.h"
>>   #include "xe_guc_submit.h"
>>   #include "xe_memirq.h"
>> @@ -865,6 +866,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>   	if (ret)
>>   		return ret;
>>   
>> +	ret = xe_guc_rc_init(guc);
>> +	if (ret)
>> +		return ret;
>> +
>>   	ret = xe_guc_engine_activity_init(guc);
>>   	if (ret)
>>   		return ret;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index e2e6edb851ae..e7c90b6244e0 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -76,7 +76,6 @@
>>    * exposes a programming interface to the host for the control of SLPC.
>>    *
>>    * Frequency management:
>> - * =====================
>>    *
>>    * Xe driver enables SLPC with all of its defaults features and frequency
>>    * selection, which varies per platform.
>> @@ -86,12 +85,20 @@
>>    * thus saving power. Base profile is default and ensures balanced performance
>>    * for any workload.
>>    *
>> - * Render-C States:
>> - * ================
>> + * Render-C States (GuC RC):
>>    *
>>    * Render-C states is also a GuC PC feature that is now enabled in Xe for
>>    * all platforms.
>>    *
>> + * The implementation for GuC Power Management features is split as follows:
>> + *
>> + * xe_guc_rc:  Logic for handling GuC RC
>> + * xe_gt_idle: Host side logic for RC6 and Coarse Power gating (CPG)
>> + * xe_guc_pc:  Logic for all other SLPC related features
>> + *
>> + * There is some cross interaction between these where host C6 will need to be
>> + * enabled when we plan to skip GuC RC. Also, the GuC RC mode is currently
>> + * overridden through 0x3003 which is an SLPC H2G call.
>>    */
>>   
>>   static struct xe_guc *pc_to_guc(struct xe_guc_pc *pc)
>> @@ -253,22 +260,6 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>>   	return ret;
>>   }
>>   
>> -static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
>> -{
>> -	struct xe_guc_ct *ct = pc_to_ct(pc);
>> -	u32 action[] = {
>> -		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
>> -		mode,
>> -	};
>> -	int ret;
>> -
>> -	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>> -	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
>> -		xe_gt_err(pc_to_gt(pc), "GuC RC enable mode=%u failed: %pe\n",
>> -			  mode, ERR_PTR(ret));
>> -	return ret;
>> -}
>> -
>>   static u32 decode_freq(u32 raw)
>>   {
>>   	return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
>> @@ -1050,30 +1041,6 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>>   	return ret;
>>   }
>>   
>> -/**
>> - * xe_guc_pc_gucrc_disable - Disable GuC RC
>> - * @pc: Xe_GuC_PC instance
>> - *
>> - * Disables GuC RC by taking control of RC6 back from GuC.
>> - *
>> - * Return: 0 on success, negative error code on error.
>> - */
>> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>> -{
>> -	struct xe_device *xe = pc_to_xe(pc);
>> -	struct xe_gt *gt = pc_to_gt(pc);
>> -	int ret = 0;
>> -
>> -	if (xe->info.skip_guc_pc)
>> -		return 0;
>> -
>> -	ret = pc_action_setup_gucrc(pc, GUCRC_HOST_CONTROL);
>> -	if (ret)
>> -		return ret;
>> -
>> -	return xe_gt_idle_disable_c6(gt);
>> -}
>> -
>>   /**
>>    * xe_guc_pc_override_gucrc_mode - override GUCRC mode
>>    * @pc: Xe_GuC_PC instance
>> @@ -1217,9 +1184,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>   		return -ETIMEDOUT;
>>   
>>   	if (xe->info.skip_guc_pc) {
>> -		if (xe->info.platform != XE_PVC)
>> -			xe_gt_idle_enable_c6(gt);
>> -
>>   		/* Request max possible since dynamic freq mgmt is not enabled */
>>   		pc_set_cur_freq(pc, UINT_MAX);
>>   		return 0;
>> @@ -1257,15 +1221,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>   	if (ret)
>>   		return ret;
>>   
>> -	if (xe->info.platform == XE_PVC) {
>> -		xe_guc_pc_gucrc_disable(pc);
>> -		return 0;
>> -	}
>> -
>> -	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
>> -	if (ret)
>> -		return ret;
>> -
>>   	/* Enable SLPC Optimized Strategy for compute */
>>   	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>>   
>> @@ -1285,10 +1240,8 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>>   {
>>   	struct xe_device *xe = pc_to_xe(pc);
>>   
>> -	if (xe->info.skip_guc_pc) {
>> -		xe_gt_idle_disable_c6(pc_to_gt(pc));
>> +	if (xe->info.skip_guc_pc)
>>   		return 0;
>> -	}
>>   
>>   	mutex_lock(&pc->freq_lock);
>>   	pc->freq_ready = false;
>> @@ -1310,7 +1263,6 @@ static void xe_guc_pc_fini_hw(void *arg)
>>   		return;
>>   
>>   	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
>> -	xe_guc_pc_gucrc_disable(pc);
>>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>>   
>>   	/* Bind requested freq to mert_freq_cap before unload */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index 0e31396f103c..1b95873b262e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -15,7 +15,6 @@ struct drm_printer;
>>   int xe_guc_pc_init(struct xe_guc_pc *pc);
>>   int xe_guc_pc_start(struct xe_guc_pc *pc);
>>   int xe_guc_pc_stop(struct xe_guc_pc *pc);
>> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>>   int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
>>   int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>>   void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
>> new file mode 100644
>> index 000000000000..321a071b7932
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
>> @@ -0,0 +1,138 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include <linux/device/devres.h>
>> +#include <drm/drm_print.h>
>> +
>> +#include "abi/guc_actions_slpc_abi.h"
>> +#include "xe_device.h"
>> +#include "xe_force_wake.h"
>> +#include "xe_gt.h"
>> +#include "xe_guc.h"
>> +#include "xe_gt_idle.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_guc_ct.h"
>> +#include "xe_guc_rc.h"
>> +#include "xe_pm.h"
>> +
>> +/**
>> + * DOC: GuC RC (Render C-states)
>> + *
>> + * GuC handles the GT transition to deeper C-states in conjunction with Pcode.
>> + * GuC RC can be enabled independently of the frequency component in SLPC, which is
>> + * also controlled by GuC.
>> + *
>> + * This file will contain all H2G related logic for handling Render C-states. There are
>> + * some calls to xe_gt_idle, where we enable host C6 when GuC RC is skipped. GuC RC
>> + * is mostly independent of xe_guc_pc with the exception of functions that override the mode
>> + * for which we have to rely on the SLPC H2G calls.
> nit: I guess we try to fit comments in regular 80 columns, and only let the code go up to 100
ok.
>
>> + */
>> +
>> +static int guc_action_setup_gucrc(struct xe_guc *guc, u32 control)
>> +{
>> +	u32 action[] = {
>> +		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
>> +		control,
>> +	};
>> +	int ret;
>> +
>> +	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>> +	if (ret && !(xe_device_wedged(guc_to_xe(guc)) && ret == -ECANCELED))
>> +		xe_gt_err(guc_to_gt(guc),
>> +			  "GuC RC setup %s(%u) failed (%pe)\n",
>> +			   control == GUCRC_HOST_CONTROL ? "HOST_CONTROL" :
>> +			   control == GUCRC_FIRMWARE_CONTROL ? "FIRMWARE_CONTROL" :
>> +			   "UNKNOWN", control, ERR_PTR(ret));
>> +	return ret;
>> +}
>> +
>> +/**
>> + * xe_guc_rc_disable() - Disable GuC RC
>> + * @guc: Xe GuC instance
>> + *
>> + * Disables GuC RC by taking control of RC6 back from GuC.
>> + *
>> + * Return: 0 on success, negative error code on error.
>> + */
>> +int xe_guc_rc_disable(struct xe_guc *guc)
>> +{
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	int ret;
>> +
>> +	if (xe->info.skip_guc_pc)
>> +		return 0;
>> +
>> +	ret = guc_action_setup_gucrc(guc, GUCRC_HOST_CONTROL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return xe_gt_idle_disable_c6(guc_to_gt(guc));
>> +}
>> +
>> +static void xe_guc_rc_fini_hw(void *arg)
>> +{
>> +	struct xe_guc *guc = arg;
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +
>> +	if (xe_device_wedged(xe))
>> +		return;
>> +
>> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>> +	xe_guc_rc_disable(guc);
>> +}
>> +
>> +/**
>> + * xe_guc_rc_init() - Initialize GuC RC
>> + * @guc: Xe GuC instance
>> + *
>> + * Initializes GuC RC feature.
>> + *
>> + * Return: 0 on success, negative error code on error.
>> + */
>> +int xe_guc_rc_init(struct xe_guc *guc)
>> +{
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +
> should we care about xe_device_uc_enabled() like we have below?
will add.
>
>> +	if (xe->info.skip_guc_pc)
>> +		return 0;
>> +
>> +	return devm_add_action_or_reset(xe->drm.dev, xe_guc_rc_fini_hw, guc);
>> +}
>> +
>> +static int xe_guc_rc_enable(struct xe_guc *guc)
>> +{
>> +	return guc_action_setup_gucrc(guc, GUCRC_FIRMWARE_CONTROL);
>> +}
>> +
>> +/**
>> + * xe_guc_rc_start() - Enable GuC RC feature if applicable
>> + * @guc: Xe GuC instance
>> + *
>> + * Enables GuC RC feature.
>> + *
>> + * Return: 0 on success, negative error code on error.
>> + */
>> +int xe_guc_rc_start(struct xe_guc *guc)
>> +{
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +
>> +	xe_gt_assert(gt, xe_device_uc_enabled(xe));
>> +
>> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>> +	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
>> +		return -ETIMEDOUT;
>> +
>> +	if (xe->info.platform == XE_PVC)
>> +		return xe_guc_rc_disable(guc);
>> +
>> +	if (xe->info.skip_guc_pc) {
>> +		xe_gt_idle_enable_c6(gt);
>> +		return 0;
>> +	}
>> +
>> +	return xe_guc_rc_enable(guc);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
>> new file mode 100644
>> index 000000000000..2500b0d1c151
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_rc.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GUC_RC_H_
>> +#define _XE_GUC_RC_H_
>> +
>> +#include <linux/types.h>
> still not needed
>
> did you miss [1] ?
>
> [1] https://patchwork.freedesktop.org/patch/694838/?series=159128&rev=1#comment_1276769
yes, will add.
>
>> +
>> +#include "xe_guc.h"
> still not needed
>
>> +
>> +struct xe_gt;
> still not needed
removed.
>
>> +struct xe_guc;
>> +
>> +int xe_guc_rc_disable(struct xe_guc *guc);
>> +int xe_guc_rc_start(struct xe_guc *guc);
>> +int xe_guc_rc_init(struct xe_guc *guc);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 157520ea1783..91eaddad331e 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -14,6 +14,7 @@
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_guc.h"
>>   #include "xe_guc_pc.h"
>> +#include "xe_guc_rc.h"
>>   #include "xe_guc_engine_activity.h"
>>   #include "xe_huc.h"
>>   #include "xe_sriov.h"
>> @@ -216,6 +217,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>>   	if (ret)
>>   		goto err_out;
>>   
>> +	ret = xe_guc_rc_start(&uc->guc);
>> +	if (ret)
>> +		goto err_out;
>> +
>>   	xe_guc_engine_activity_enable_stats(&uc->guc);
>>   
>>   	/* We don't fail the driver load if HuC fails to auth */
>> @@ -246,7 +251,8 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
>>   
>>   void xe_uc_gucrc_disable(struct xe_uc *uc)
> again, do we really need this as separate uc call?
This was added in a previous patch, not needed now.
>
>>   {
>> -	XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
>> +	xe_gt_WARN_ONCE(uc_to_gt(uc), xe_guc_rc_disable(&uc->guc) != 0,
>> +			"Unable to disable GuC RC for gt: %d", uc_to_gt(uc)->info.id);
> again, can't we have this in xe_guc_rc_disable?

will check there.

Thanks,

Vinay.

>
>>   }
>>   
>>   void xe_uc_stop_prepare(struct xe_uc *uc)
