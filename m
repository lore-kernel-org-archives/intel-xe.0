Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45092C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 21:44:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB2E10E057;
	Wed, 30 Jul 2025 21:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PAGz2G5d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757C610E057
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 21:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753911888; x=1785447888;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ltSIStA8Il30Q+epRy83/3ss2GpmH7MUM61xhxDBYjI=;
 b=PAGz2G5dxCTM3AqRhhCWIQ+Wx5E82nBJjQLJut7ElH5xFg/Kygrk3bAj
 AdPcZl0xad2Q9uWN2Ocxx0vgRB8KaMOJYa0mh9INDcBaAEwjxFmg5jZYW
 mCrdC9H7cUDNXgi41KjfVmMJMuaeMNzeRvs7M9sfb53UtrZYoxi6AFhVe
 +Mm1M5joMU1yFfIZ/zdD8UcN3A6ushnb1a6qRF62nSxo0AOmMLJy5RgDZ
 9xyAyE97iRIZHlBGIZlVO/DaNmDWXZ6Gqvn6MNx2IYrppP4BryR31Z57N
 Q39uHwP8bJ8PLs/PhjdoTFNA5LcG3Py5C8Qwyq0Tb/dWO8xZLY1z35GCO g==;
X-CSE-ConnectionGUID: Sx/ATVrlTdCUQtmp3pPOsg==
X-CSE-MsgGUID: HPy/p8kWRguwKzTH60WRxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="55430852"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="55430852"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 14:44:45 -0700
X-CSE-ConnectionGUID: nJHVEaR5QauJiF0Y2nADww==
X-CSE-MsgGUID: ExTN+PikRlSSS0wUa8g81g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="186785111"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 14:44:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 14:44:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 14:44:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.83)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 30 Jul 2025 14:44:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caa5l1dEwbJqINx61kDH5rXmrs7l/P+uDCtzkZCFjb0FpYLNsCHQc61vTzqK7klSLjvwzA14NS3879DCsUUXxG8LV3V5H0VJrJuZ48e/xuGzzkSYEaStuNjfuShbTt0KdBZQWayZEQ72AeBRbXJa9nyPvM5MdrwjqmBNQUa3KctPkLpxWUehqWMlOToMor5RmGyH3I85TuP5AKNJbRsEykErLUzMeCDKYBsNYIYVsNkd1TXW0KZHDxHkO3log7afa7Nz6xdaaov2EvM2BBvF9xsZ7ryeBpd5gYDSZNBotID2hSuBOV2zENFqFfs/AwOg89wOKW2nRzRZlpYzDW0sjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ge8NPxHxMFSQK+ftvcuahGp6eHl2LNvLHD8OfJRqr6w=;
 b=uwcxp3NV5HZrPUTRqUwhUnPhocHGklwSjT7bdsqDx9xdPfwLv7ZK9j76dwALNicmoECoTeTozZh/6uMtZ6KkmVZ+619uZUw/Z9dkcOzM2+YBvBbFJAnPe1p5yE11OQj7n9JLQMM2tptUV3UFmV5vxWOFlWkUHP3BryvxIlpMjDEBZTdFxQHQ/F2/7DrIB0axhSYwadAVZs6g0hfjBnhoWRYyiW9yU8muuOd86NnLtX4F+6Fj0JiJ7aGM9SrEt+yX3x5F4zRBVvLVvmhVkIPzezlLXzjTlwUJ6SPG9zxHyQUeizGKVPDHLItVvISjwiJtD9girg9kIt9R76atrHnr3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Wed, 30 Jul
 2025 21:44:37 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%4]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 21:44:37 +0000
Message-ID: <84436334-ffb0-4a38-ad50-1f9ce36727c6@intel.com>
Date: Wed, 30 Jul 2025 23:44:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/pf: Make sure PF is ready to configure VFs
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20250730174913.178434-1-michal.wajdeczko@intel.com>
 <20250730174913.178434-3-michal.wajdeczko@intel.com>
 <CH0PR11MB5444CEA80C83A713DEE5CAC1E524A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB5444CEA80C83A713DEE5CAC1E524A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0052.eurprd04.prod.outlook.com
 (2603:10a6:802:2::23) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB6771:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ecf46a2-62cd-49f2-f0d6-08ddcfb247c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkZxRFZPdGhhL09PZmdselFTNmhEK0d4VldiZGdLelVML2I4WWFVYTFMZHU4?=
 =?utf-8?B?eE96bFZOSHJRUnAwU21xcHE5aFJZL0pFTzFvNHM0b1VabkpKNjc2KzNNd1Fp?=
 =?utf-8?B?cXR3M2lnOFdMTHRCY2FLdmdjWlRhbXZBblU3dUxwWWRvOE1pdllEQUFEd21R?=
 =?utf-8?B?OXR4a3RncTJZNFkrUEM3VVpzYndPT1podHRxQldDZy9hY0RuaGV0YW81Smwr?=
 =?utf-8?B?WWcyNmlJMGZ2b3ZsS1ExMjNsK2w5Z3d0MUF0Z2JXT3JERUU5dEs1WWRsV3BY?=
 =?utf-8?B?L1lmZkYvUzMrU3lnYTRFbVRzeVFQREhubkdWT1Q2aDBUdDVielRMSEFjK3cw?=
 =?utf-8?B?aWx1QlRtV1ExL2JUYis5SFV1Tm9ER2gvb2l0NWpnUEk2Q1BReU8rZDUwaHpw?=
 =?utf-8?B?SGlhK0ZTS1NXY0F1NlVaQW91KzdpVnNnU3lSUnU1TmhPUUlYQ1htZTBTZ0Qy?=
 =?utf-8?B?ZHlTZ1ppa1VSam90MDc1dWIyVmVnRHluNHl3MDZlTmpjbVN4VmhPeHdaTWVq?=
 =?utf-8?B?ZnlHVkZsMlNMWmlDY0UwcVJDYWp0K29IN1ZzMTl0UFYwRFQwQ2dmRHp4SC9E?=
 =?utf-8?B?NlMzWGNsekVrdUsxZkVrMmMrT1pTRzFjdnQ3VldzRndtaHZkZkdGNitXRmJz?=
 =?utf-8?B?anJvWUpFd2VCV2RvT05jZ05VYkowL0pLYUpPMDNXN1MrUDFucDRSYURwNnZ2?=
 =?utf-8?B?c2dzSVFaR002S2E2SzczdGVadU9OTTJSMFU1aE10WlBvZkE4NXFYOEhrejhU?=
 =?utf-8?B?RkZnbjJ2QVVsZXVacEJwU1k0T0lxZm1VY1d6b1ZrYStHaXZjblBKcVdIZURs?=
 =?utf-8?B?OXRnYTVxSjUwK1pxRkF0bVdUazd6UG5YcXA0b2VTUEc4Q255K0FOOUx2V2dH?=
 =?utf-8?B?d2o2ZGdoSUNScGFaaFVHTXZmYVVjYTQ0SEZaQU9Ia01kYXZ6MkNyd25TSStz?=
 =?utf-8?B?RENJYUNVclBpTk9GY3Vzc1Q4Tis1akx1RmQ5ekhLVUxYT0lXY1VLWTBSa0Rp?=
 =?utf-8?B?b2tvOHU5d0VHcVhnd2NXeWVkTzFhdlZsWUJpc2k1Nm8rQUxiSFN4UktYanNF?=
 =?utf-8?B?ekU3aHZGTTZ6ODI0TkRibFlvWE5qdVU1eUYyeC9xKy9uTXJyRkFYMExnQ3Az?=
 =?utf-8?B?a1p3c3NQRGt6Q3hxdk1rTk5Pd3pENnF6ZWdLYm5DZ0U4WUc0bWlNVXQ1WXEr?=
 =?utf-8?B?aWJnV0V5dkY0bnp5U2ZCVkc5RWRnUnVaZDhrM1JneHlkMmgvNkEzWTgrd2ZO?=
 =?utf-8?B?ZFFmZ0NNZVRoR0lkT2hVTGxWWFlaK0dXNGFsK1ZTT1YwYlg0b0NMTThXUnJm?=
 =?utf-8?B?NXVBVDFPWEE1cDd2eS82S3E4emNMeUZmMlJ6NHVzK2JXeHBsUS9ReEpnWTEw?=
 =?utf-8?B?enhhT25tU1gzNk9FRTJ3TER1OVdWTXl5UTVPSmpNMXZmSWhEWndSQ0NQTkdu?=
 =?utf-8?B?TWpSWFdEMU96WFQzbHRnZDh3VTZWeDluK3A5amFMQkxnNEppM1VyTks3QjNy?=
 =?utf-8?B?TE12djVidm5BTEpxQS9NMElPQVVrZEdZTTlMc0U2VU5RaFkwdVFtREZaNGo5?=
 =?utf-8?B?SU1DcWRRQzdLN0M5ZFBMMkV0eWNrcU9ZUy83VTNmMXFrWFh4b1BaQlhOTFBq?=
 =?utf-8?B?UFJXQ2d5SGgrZExSVE5ZWUUzOGxxenFsYlNrK05qcXViVkJWOTRKTGx4OFh6?=
 =?utf-8?B?eStjaHg0czRRdFJtM2RHcFBwVGFseVZNR0Fabi9Tb1dtbTFhVHQvVEdtVDM3?=
 =?utf-8?B?WVJCS01OYUVldGxHaEFMRytqNVhJZ05BelFkN1BuRGRZemFNU1dZRDdWVytk?=
 =?utf-8?B?ZXhiZkp0MExRVE9WbWVnbk5ONy9GQnF1YWFJT2NtUWQvRmpCZ0N4MmtDcUpl?=
 =?utf-8?B?SUs2SzdCMU5SMExLdXNKSml5aUtHTWhqc1NDNzRhNE54d3lENnJhVlVXU2JS?=
 =?utf-8?Q?6CnZmW2rWlQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHR5M29HS0pZZmc2VTBEVjFJTWtyalB2U1FXYm1kcFVPOWRBaXJWMkpaRDNC?=
 =?utf-8?B?SUFuYjlQVVFlUC9iMmhLZm5rbDVQSmtyWHV4ZGFZYnkwK2t6ZS9PQXRmalRn?=
 =?utf-8?B?UXZLR1hPOTNmbzVqT1dSOVZiYzRKWWcwZXR6SjgxZ1U2bCtvUC9OaU5seDJR?=
 =?utf-8?B?RlkzNW9oRnZORVRMa3c4M0JmT1JRaEYrYVZuUGJtUkk2RVVuejBaT3ErbU9h?=
 =?utf-8?B?ejFQRnJqVGZZd2ZWYWJCdmRRWFFCNUU2ZmxWZU9FbHUzRG9TYXBYZ3QzZXFj?=
 =?utf-8?B?VHRnYW1MMWd4TEpKenA2NWpSaERLQXI1WjQ1R1RkVTg2MmhhOXdFWFFuYU00?=
 =?utf-8?B?OCtNWnhia0w0SERGNmo1czdhaUc4SzJ0Yzd1OVpJc09nMEVlSjhBZWR4Ti9Q?=
 =?utf-8?B?Uk5lZXJVWWtENHdXK0JOamVCckdrcUQwV0xLUjA2eG9zS240Q1pPNkp1NjhK?=
 =?utf-8?B?QTg4SWc5Y0tYSEplalNYejd1SU54Q1ROSS9HYnM5TVdjVWpuS1JNM3VVUXd1?=
 =?utf-8?B?SVRCTFppSkVid0tGZ1lQOElqbU51amhVRDF2S0ZFdzBLWFlTZEovM1MvUDhw?=
 =?utf-8?B?QVdwaFdlVlBWcCtINHVJdHVXY2VWVytvZ0Q3aVJLRUR2bkhlS2dGZDlLVUNZ?=
 =?utf-8?B?ei9Zd3o3Wlo0SDN4Vi9UajJ0djdIdWp4WDBpQlJ2MnBHUWhzdVl5SkI1cW5R?=
 =?utf-8?B?SjEwd3E3dFFSNzZvUVRiUmo5dWJ5S2xTYWY3UGNYMDhhdlVudVFiOTVsejIw?=
 =?utf-8?B?MEtmMENSSUJycUFJWjdHTUJnaTcvTEhVanA4WHJzMWhuNldwb3l6TFpTM1FX?=
 =?utf-8?B?R3QzdlQ4Y3VDdkNyMHFya0Fxd1Z2WERJbXdyMFlLZFpSMVgrOGFzRy9iRWxu?=
 =?utf-8?B?VmtObzB5bTc1aEZVZzJJNmVQQ2p6V0U5MGVpbzJ4cS9BbVhsYzVMQzdFcm15?=
 =?utf-8?B?aGEwUFBYTEg3bkVIV2RPUHhrVDBPdEk4TVAvT2FSSFpxVnBCQTVaMnljY1BB?=
 =?utf-8?B?L0pRNFBWTGdma1BUT0NxQ3Z1ZFNNWks4Vk1pVjRIeUtuZmMzcGp1NFhMQmZ3?=
 =?utf-8?B?TkJ4MmswUVB1M1k4V0EwNGlPMDlvZnhGMlZvK3kwMmphTHNPZ3NYQkI3U21S?=
 =?utf-8?B?WDhueEpaNmppYVlpdVVNaTljd2ZzV2FuOHhtODBxZTY0QmozNXo1Ylg5VEtM?=
 =?utf-8?B?ZUlCcHlmSUUrcmtPSTNFbUFJTzJZdWEySmtxWHl6Y1k5Y1c5U0t4WklvQkxN?=
 =?utf-8?B?UFBJMVFnRXF3YkI5b0NHVXh0S0FXV2wxNW5OTHlBakJjTWd3VER6aWNicDZ2?=
 =?utf-8?B?YUgxbmIzWXZUN1FjT2tucng4cmdDUndiY0R6VDdEejdYdVVqbjhJdFo3VDVz?=
 =?utf-8?B?aGlrSFdSN3B3QXVoRFpmcjZlZTFyZkcrNWtOeEJJY29kWEhTaHFFTEZTNFBS?=
 =?utf-8?B?NHVQZUFsb2p4SE1Sa0RjV1Z5MUxTbUF2WklOdVBhMzk5Tys5NGlQMFl4cVlJ?=
 =?utf-8?B?QTV2SHJ4UWJZY1FES3luN1c2L2FoeUhmYUxjb2FUbGtvMEFma0tIOE5kNUNu?=
 =?utf-8?B?d2pEcFJqbG5ld3R3T3VldVRGaE5BU1RwNHhWRGErZTE3REFGa205OVppUTc3?=
 =?utf-8?B?ZE82Mnp4YjYwVkJVQ01oT0VaN0FJZFBQMmQ1VjduWHN5eGNqbkcyaW5RNWNz?=
 =?utf-8?B?blBrVkg0eGgweWhyRmJlN3dLb1RHbDZ0RnhqYmxVd2oxN2ZBZU9SL3N0aEw5?=
 =?utf-8?B?dWE1dmQ4Z1BtWkRBMzdLMDliR2ZSdGlRVHpvZVQyMGJZTjYyOTBEZEt1Qm1P?=
 =?utf-8?B?eVFMSThzVGtaUGVjV3BlQTROOC9lc1ZnZ3YxVWFpeW5EekNPOGNwNTVZVjJn?=
 =?utf-8?B?cVBSQVhjU2srY1FPQmNIMzJiT0M1MkVFc0xQeHozQi92UDk1YThPSDBOTkVW?=
 =?utf-8?B?alF0QmgrK2o5ZUlmYWkwVklGcURQajNDMkVFUk5pMTVCc1hFMEVCT2xsKzUy?=
 =?utf-8?B?ZFdGR2UzbVFUSTZSTjVTREVnQitlSXJZV3ptMHNVN0FmQzBVNlorNUU3czFT?=
 =?utf-8?B?T0ZwUU9lSldBZlZpZ0ZkbVdCbTFZczMzemZhNGxVbXFDTTMrN1ZieFBqakQ0?=
 =?utf-8?B?V2lGM0hmcWU5RzhuUlB6Z2NYK2JHejNsTVVNNzQ4aTkweURIZWRObjFZTEJw?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ecf46a2-62cd-49f2-f0d6-08ddcfb247c6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 21:44:37.3676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sIVt2QRBtCBF3TrgCKx+z90lWIWgrGtJiOcfFQvvZJ5NsDjKFSkOTbFG+B0SE7LkarFLMfjHwVBAvN5vR402LxpuBA4D6DaMrvYgmv3GI5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6771
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



On 7/30/2025 11:09 PM, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal Wajdeczko
> Sent: Wednesday, July 30, 2025 10:49 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> Subject: [PATCH 2/3] drm/xe/pf: Make sure PF is ready to configure VFs
>>
>> The PF driver might be resumed just to configure VFs, but since
>> it is doing some asynchronous GuC reconfigurations after fresh
>> reset, we should wait until all pending works are completed.
>>
>> This is especially important in case of LMEM provisioning, since
>> we also need to update the LMTT and send invalidation requests
>> to all GuCs, which are expected to be already in the VGT mode.
>>
>> Fixes: 68ae022278a1 ("drm/xe/pf: Force GuC virtualization mode")
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c         | 28 +++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf.h         |  1 +
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c |  4 ++-
>>  drivers/gpu/drm/xe/xe_pci_sriov.c           |  7 +++++-
>>  drivers/gpu/drm/xe/xe_sriov_pf.c            | 27 ++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_sriov_pf.h            |  1 +
>>  6 files changed, 66 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> index 2761319fdc26..8bc7d7f9f47a 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> @@ -16,6 +16,7 @@
>>  #include "xe_gt_sriov_pf_migration.h"
>>  #include "xe_gt_sriov_pf_service.h"
>>  #include "xe_gt_sriov_printk.h"
>> +#include "xe_guc_submit.h"
>>  #include "xe_mmio.h"
>>  #include "xe_pm.h"
>>  
>> @@ -258,3 +259,30 @@ void xe_gt_sriov_pf_restart(struct xe_gt *gt)
>>  {
>>  	pf_queue_restart(gt);
>>  }
>> +
>> +static bool pf_flush_restart(struct xe_gt *gt)
>> +{
>> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt))); 
> 
> Asserting here seems unnecessary.  If we're certain that the pf functions
> will never be called in a non-pf context, then we probably don't need to
> assert the system is in sriov-pf mode here.  And if we aren't certain of this,
> it probably makes more sense to put the assertion in
> xe_gt_sriov_pf_wait_ready instead, or to have a separate return path instead
> of breaking instantly.

the purpose of using our xe_assert() is exactly to be certain that we never call
functions in an unexpected way, without having to analyze crash logs when someone
actually make a mistake 

and while I'm certain that today I'm not calling that wrong, I don't know what
others will do next day

and here in this function we are accessing a PF-only member of the union, so
like in the rest of the SRIOV code, we have explicit assert to tag function

and all xe_asserts() are compiled away on production builds, so no worry

> 
> Unless the system can exit sriov-pf mode in the middle of execution?  I don't
> think that's a possibility, though.
> 
> The assertion by itself isn't harmful if we're assuming the system would never
> hit the assertion in a non-sriov-pf context, though, so I won't block on it's
> removal.  Though a justification would do well here, if only for my sake.

the goal of asserts is that we don't expect they will be hit

> 
> Everything else is
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
>> +
>> +	return flush_work(&gt->sriov.pf.workers.restart);
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_pf_wait_ready() - Wait until per-GT PF SR-IOV support is ready.
>> + * @gt: the &xe_gt
>> + *
>> + * This function can only be called on PF.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_gt_sriov_pf_wait_ready(struct xe_gt *gt)
>> +{
>> +	/* don't wait if there is another ongoing reset */
>> +	if (xe_guc_read_stopped(&gt->uc.guc))
>> +		return -EBUSY;
>> +
>> +	if (pf_flush_restart(gt))
>> +		xe_gt_sriov_dbg_verbose(gt, "ready after restart\n");
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
>> index e2b2ff8132dc..e7fde3f9937a 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
>> @@ -11,6 +11,7 @@ struct xe_gt;
>>  #ifdef CONFIG_PCI_IOV
>>  int xe_gt_sriov_pf_init_early(struct xe_gt *gt);
>>  int xe_gt_sriov_pf_init(struct xe_gt *gt);
>> +int xe_gt_sriov_pf_wait_ready(struct xe_gt *gt);
>>  void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
>>  void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid);
>>  void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> index bf679b21f485..3ed245e04d0c 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> @@ -22,6 +22,7 @@
>>  #include "xe_gt_sriov_pf_policy.h"
>>  #include "xe_gt_sriov_pf_service.h"
>>  #include "xe_pm.h"
>> +#include "xe_sriov_pf.h"
>>  
>>  /*
>>   *      /sys/kernel/debug/dri/0/
>> @@ -205,7 +206,8 @@ static int CONFIG##_set(void *data, u64 val)					\
>>  		return -EOVERFLOW;						\
>>  										\
>>  	xe_pm_runtime_get(xe);							\
>> -	err = xe_gt_sriov_pf_config_set_##CONFIG(gt, vfid, val);		\
>> +	err = xe_sriov_pf_wait_ready(xe) ?:					\
>> +	      xe_gt_sriov_pf_config_set_##CONFIG(gt, vfid, val);		\
>>  	xe_pm_runtime_put(xe);							\
>>  										\
>>  	return err;								\
>> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> index 27b148eab49c..af05db07162e 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> @@ -16,6 +16,7 @@
>>  #include "xe_pci_sriov.h"
>>  #include "xe_pm.h"
>>  #include "xe_sriov.h"
>> +#include "xe_sriov_pf.h"
>>  #include "xe_sriov_pf_helpers.h"
>>  #include "xe_sriov_printk.h"
>>  
>> @@ -154,6 +155,10 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>>  	xe_assert(xe, num_vfs <= total_vfs);
>>  	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
>>  
>> +	err = xe_sriov_pf_wait_ready(xe);
>> +	if (err)
>> +		goto out;
>> +
>>  	/*
>>  	 * We must hold additional reference to the runtime PM to keep PF in D0
>>  	 * during VFs lifetime, as our VFs do not implement the PM capability.
>> @@ -191,7 +196,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>>  failed:
>>  	pf_unprovision_vfs(xe, num_vfs);
>>  	xe_pm_runtime_put(xe);
>> -
>> +out:
>>  	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
>>  			num_vfs, str_plural(num_vfs), ERR_PTR(err));
>>  	return err;
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
>> index afbdd894bd6e..7e8f3d3ac656 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
>> @@ -9,6 +9,7 @@
>>  
>>  #include "xe_assert.h"
>>  #include "xe_device.h"
>> +#include "xe_gt_sriov_pf.h"
>>  #include "xe_module.h"
>>  #include "xe_sriov.h"
>>  #include "xe_sriov_pf.h"
>> @@ -102,6 +103,32 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
>>  	return 0;
>>  }
>>  
>> +/**
>> + * xe_sriov_pf_wait_ready() - Wait until PF is ready to operate.
>> + * @xe: the &xe_device to test
>> + *
>> + * This function can only be called on PF.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_sriov_pf_wait_ready(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +	int err = 0;
>> +
>> +	if (xe_device_wedged(xe))
>> +		return -ECANCELED;
>> +
>> +	for_each_gt(gt, xe, id) {
>> +		err = xe_gt_sriov_pf_wait_ready(gt);
>> +		if (err)
>> +			break;
>> +	}
>> +
>> +	return err;
>> +}
>> +
>>  /**
>>   * xe_sriov_pf_print_vfs_summary - Print SR-IOV PF information.
>>   * @xe: the &xe_device to print info from
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
>> index c392c3fcf085..e3b34f8f5e04 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_pf.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
>> @@ -15,6 +15,7 @@ struct xe_device;
>>  #ifdef CONFIG_PCI_IOV
>>  bool xe_sriov_pf_readiness(struct xe_device *xe);
>>  int xe_sriov_pf_init_early(struct xe_device *xe);
>> +int xe_sriov_pf_wait_ready(struct xe_device *xe);
>>  void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root);
>>  void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
>>  #else
>> -- 
>> 2.47.1
>>
>>

