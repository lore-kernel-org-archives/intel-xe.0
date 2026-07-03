Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7DFC43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 13:31:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13D410F80A;
	Fri,  3 Jul 2026 13:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NOqih/RH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548A510F80A
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 13:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783085470; x=1814621470;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HMkATlnGb0FUZKXeUuDuJLrKQSjAc9YFFvOs4ag5x8Q=;
 b=NOqih/RHKyCMa8gJrej5iSVVhX8LtutvT5knPSfe8L2wIVQAsiCEstlB
 TbsDhCMXn19qyVpquq3a4pPkr3a28/PRutkKiBWAGjmk+QMl6F3x3JyaI
 TZSvOyKk9AU53uvMVwozb0pu5ptN3otHiBvrSF6u/ZErtT95ABgFeW92D
 JRvvm1/JX79ZZ9UUUtDVVlppK4gf6y7MOTkFt6CBWXg4PXGgMRPz1IaNQ
 woZNqzeTp6I9yTiOSynvT7jzbn8AehmSyTcg/Rc98uSHeRvbrGSB2AAsO
 eInRUiUSykDOkhTr6Rlg7yalRhLjc820f8ceh8pcMVwbWdeAbhgmcJ5pS Q==;
X-CSE-ConnectionGUID: rkOXSMfQSniNcbyBp4CK0w==
X-CSE-MsgGUID: QYDfbTLdS3+zsYiWP+dxcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="82826630"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="82826630"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 06:31:10 -0700
X-CSE-ConnectionGUID: NIthDZ4SRJqWhJL63bS7zw==
X-CSE-MsgGUID: 5Igpr7QKTLKcRkD5cr8jmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="251395246"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 06:31:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 06:31:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 06:31:09 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 06:31:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kp23BxSi6KmjPLHjGUBeAQQjG7LfaYe7NfNU/Z9zEyM21PwapIHd2VNO1h4E4KMqM2/Z2hl9wIEsY+s4Q43283DGPKQDUCjK4WZGgWIOnvR/JobDze8m2joYg6SEf/yFD3/4Sadglu5AH5uRp88Ml8SANqUAI3BbqSfEOOsER/ZOejCJ/INUsUFuBy9zT+HHD0Wvc3LooAxlXn6JMV56oSOgCjT9Vx3WKmU8uPJa23jGQpBAQVn0vfXu1j7c4dHkGol3RxaF9dWUtDBm2Cfhw/wMEMzOEh/zdOmlCTm9QP4+QRHWmS4dAK8AqVgB2D9eoK45+9F53r+fBbXXf+XMLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50E76S6zwztOuVnZSnIiwF7kFSSMq8v6FzgZmq6N7bU=;
 b=pcatJ//rfPtCQzBdpdihbsUE9xUJhuKC60etM8lLE2tol9YYwWr2Z2SYv1GOxODQgVwd07RiPC0KeJ3cksmecpxzhtWOarglPnmT5MXUkmcvFNo+a+LOvMgPeyEdNLfnddvX8XGsYr89A2FRDI9lj+za+R/EeSJH2yFuehPc3B1r/jeg8E+g1+KvlE/KMEnxeF0CcdTJJICoV7OIYUfUoP+pNxOG7790Sy7jvVnTYXpOTx0AxRSM2OtyJiXvqqMLFFwEg1RShpKqcFjYuP0gqbJaGryP7u/EQ+Aw7YfXlJqV2abgQLFw90ggq2VDTFA6vlvnIfVcJ9JQ2rgN8NtHdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by SA0PR11MB4685.namprd11.prod.outlook.com (2603:10b6:806:9e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 13:31:07 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 13:31:07 +0000
Date: Fri, 3 Jul 2026 15:31:02 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 07/13] drm/xe/guc: Formalize Reserved KLVs
Message-ID: <ake5e2AqN96KAXD7@nostramo>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
 <20260630132633.32804-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630132633.32804-8-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VIUP296CA0130.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34a::10) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|SA0PR11MB4685:EE_
X-MS-Office365-Filtering-Correlation-Id: 85513623-fae2-4cfa-705b-08ded907566c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: gM3ZW8zayY3XuEmKPtjiLu4c6yeytUES7YTB/D2qjfv+Q7em0olYax6d5BZEv30ugdGiPxt43OFXBt/0Pq6YK+cq+RXwXivmhzxp+9JQN0bAH4Y0IdgPnORjVDfAnN2P5GDTy05rVrpZ/jCDT6NBEd0JnXU7ajSG3f0E+QnvgPxLfH4ioqp8svU8/tXbWXDE11n0rlYjcrQ5G6lUunp/1Ni003Hritg1E3db6WuaF+OhonypOroRJJBGuGyOOdvEQaVp+yzQvHR5Jz3RkKK7uC/0wJnaKN+M7iDCSoo+ZHp/FqEK68J5JhhdCcn8WpC9hcsSe1fsvDYokj+IzWpI2XtJsO85MCszwIs1VGEJ6BjwWbg+jwSL9X83Z8OI5RxCcAvsjMvWs1XYFeLDy0Ffgk6kPHlnzFVBb5zPIJ/JOOanjHnfkW22hE/fA9FUF9tMfJZtre5W87DPAxX5Q+kQHd8V6RHtlE4suPVo8G6E2vAv253ORrsqi+b9CCGqkbTvC7TMwIzvJoEh9wNVRtzn2KCt2JPXOICXfWp9MdSPFFW8ITFI2RvD0iLFxH6vRy4wMZ1kZbE0PU2DgfFpPOg4OWHvw+/oMbmBpeYEF3MQgPrsJDHfz+5KF0Rq5CYY4PiCy93F/4W5xOWfPA245BHaFN3ZU4PXJemqqg6WtJta8cM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0dWcll4QnpLcHNhYkUyTDkyay9ZVmcya0ZSWWpxbGdiNk1CNkczY1o5bDNC?=
 =?utf-8?B?WkRSeDBhc1h3R21kM3JFMy9wU2NPZmNjaGxDLzJLOS9FU20xMzJHS0h3aUNR?=
 =?utf-8?B?MVVPWkZYTW8vSkt5SURzNTlNd2JEQXBwTW5YZW9jUnRkejR0d2RCdGdQc0Vu?=
 =?utf-8?B?Y3RKVW5ZQWhOVDBjZyt1UjVrZEs3T0JudEYwZml2eDg0T1VnUkxUWWxoSCtU?=
 =?utf-8?B?T254UGZOQ1VqcHVxQWxPRXovWlhCR2JkYXFCQXlCTXBKUXV0M2Flbk14VjlY?=
 =?utf-8?B?Rm4wQXlkN2lmKzdhN2J1Z2ZpcnRjZGpyVGxBZ3dmQUFMWkRZUzY4L3YwQ3Yv?=
 =?utf-8?B?cEs4akhrOFNCMDk5K1RtRGFOVzNpVDV5N0h6VXc3MnVIOUphUmFuK3B4ZjRQ?=
 =?utf-8?B?Ky9KME9TSGJUeFZZMHhCOU8zakJyam96aE5PWlV6KzR3Snp4a1Fqd0dVRWFh?=
 =?utf-8?B?Y1Q1QjBWMi9taVFnclRaVG5XN052bFNKVzBYZUNtczJPaDRwenJRdHV4ZTIy?=
 =?utf-8?B?TENQL0IxN2pwMTBtNkN1Qk1kUDVLVHFGM3lWSWE0UGpVd2U5T2E4TG1uZjBZ?=
 =?utf-8?B?STFuM1dXMXJQRjMxKzVrMWJRQ01Edm5keG5hdnhrTkpsTVpaT1ZxMTRhQSta?=
 =?utf-8?B?cGVWVWJuL094QjI4R2N5UUpWbzVMcXJjVDBXaEd0VXZORXo3YjNVa1hkOWNQ?=
 =?utf-8?B?dUR6RWh3VVh0Nlp0UzJrblI3amxKTUZSUldka3FhMmhoQXJuU2hsSDZXZUVS?=
 =?utf-8?B?b1gweElMVGZwdENnbUhZUjdBNk9zbWpaMWFScEhMRmZBU2JSWWg2aG1WMWFH?=
 =?utf-8?B?SVBSMHVvYldDd3ZSaGxBb3ZKWlNMQng4UGp1QitDdWdaR21WYk9FazNEZFd3?=
 =?utf-8?B?MkhYVWtudy82OHAyNFZjc25rb0dhQnBhRktTMTdpR1lDa3lNWFV5SGx3d1Nl?=
 =?utf-8?B?MGVEV1ZYYmZTTEJnK2tnekZ5dXhkNDQ5ZWtPZmVaSVhPc2dkbEVQZExSL2lQ?=
 =?utf-8?B?eERMVGVKZ1g2Z2tpTkh1dDVmNzNwTlhBbjNabVRJWGs5RlZxVnlyQ2FyNW50?=
 =?utf-8?B?MUhaYmFESDdUc2l2aEs1VXdBMnBaV200aHYyYlpjcGJsZ3BWM05RbWNEMmJx?=
 =?utf-8?B?VWltbWxiNzJ6T3BTTzh5aFU1U3BsYjRBRE1qRkI1VW9laENJdG02dlNXM0hx?=
 =?utf-8?B?a3NZV3ZCSEZtR0tHRW14V2RVVGk0Y295bkhYYUVkLzNXSDhmbDM4NXY1TU5E?=
 =?utf-8?B?OTlUR29QZktOeDl5VHg2TUtaNG9GaVJuU1JyelBDdXVicmh2c2k2bSs3bGJa?=
 =?utf-8?B?bkErTTZ2bWNvYXJJS3FhSy80R05MWEswUnQxN2V2YklZNzVWSUM0bDhBdHg5?=
 =?utf-8?B?RFRxZlBVR0VBdXJ5TFdydjhXZGNEVDJrRUdDN1VmcGtGNFkzVmhWL2JDVzBm?=
 =?utf-8?B?NkFBZlhwTGRYd0JVTjBMVUFMNnZJWEJ3UVh4ZDhwWlZvRmYzcFpqUW9nTjdn?=
 =?utf-8?B?WkJqSkZWekQzTEFPcmNoaHNrcE1wYU1xaFVqa2x5SGkxRUk4dkdlaXU3d3pT?=
 =?utf-8?B?K1Zrc3NMRHlqd0tTaFg4bHVVUFVHczEyMWVHMEhOcFhMaTRBN0J5WW1WREht?=
 =?utf-8?B?N3N6OTM0bXNjNGhxT0xtYjkvK3Z3VE1jMFZLbmlKb0IyYkhSelowLytZdkk4?=
 =?utf-8?B?cHk3a2gyTG1qZElhdEgyNGM3U0xYQTg5czdPRWd5K29CUTdZcEpiQUdoUjVQ?=
 =?utf-8?B?RHE3NzVzdEZSZXBKVVVxUzBxZUk0UlVXa0dUSHNIMVVNVnFQODF4bkpDcXVO?=
 =?utf-8?B?S2dxWFFFSlJRcHRkRUd5UFFwL3JyVEM2SHhSdjlXeFhVYzQ1VitoL1RaZXlZ?=
 =?utf-8?B?MWxqdDJQODdzTFluVzFMQy9iRWNMTmtLdlRCRm1SMzc4OW5jZ0hFVWROanRq?=
 =?utf-8?B?c3R5SkpuTktKTGZ6SGJoOGRHOEhDaGhaNlpoTXhuY3JXWENsTVlWaEl3MVVN?=
 =?utf-8?B?RWg1OW5rVTlaUytTeVhveW9GMVBuckppNDN0NHhQUGdQYWVGbm1DVmJSb2N0?=
 =?utf-8?B?Y254bFZNeEVBWWRtdUVHL0FBYUwzalN5eFZ3QkZ3VnJpL3cvNEg5R1dWc0Vl?=
 =?utf-8?B?ZWFkbjUwT3Ryc0dtRDkwOG9RMmd1ZkdFOFVtQkFGbUNMK0lRSThwRmlrUkhO?=
 =?utf-8?B?STdLRk04KytPRFlsR3E0Um80QW1HUzY3clRsQkhOaGtJR096S3Z2WnJqdG5G?=
 =?utf-8?B?MWNNQXFXVlB5SWNzSGJCTVBZd2dlT0pKNTAySEdadXVKeitFWTJZM2wzWGQy?=
 =?utf-8?B?OHNwckR4ZWt3eWxidnJxSWxlc1E4R2gxVlJTa3lCaGpaTTBRSGxXaVZWY0pT?=
 =?utf-8?Q?7uWhA02n3Q2HxDBA=3D?=
X-Exchange-RoutingPolicyChecked: UDCbXPCcgyYeCzYw6INQ4HOR0x1EzVGlwBABUHSjxoZAmdy72Y7BC7pM8G9uVQPg/OJaUhaqYp40dENV2A0XWNOywehhXQdwoJJJgxYuMJpriUmHR7TAJ4wMR02B6he53z0+TkRzBR7/9AGH1llGSt9FBpo8yOaZJPnaOpmk0L3Gd9Dk88EI3IJqC1m+ua4FaeINBQuRl937VVgDV6q/5BcBAUL3vJ0xcQEWZmhfR+H1mst1gZ/Vbo7odiwgscb+3LmXW7RflZVNv/riRmfm7CEAExRSpMsBuFfPIrDZlR1IpZRYwhNMDNh6ZqX1Yck1ypDqoJPPU2k6zuGPBEZ6Hw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 85513623-fae2-4cfa-705b-08ded907566c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 13:31:07.2430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5a0UV9aSl8RhGYTdig/+ZL0kTQb6DP7jhG8Etj6cm9amuUqEqB4z0cYK+MIxIHb2uRN/RjrmIVoJsbDCmF0uKLufAOjLiCaDCUE1TJie4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4685
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

On Tue, Jun 30, 2026 at 03:26:26PM +0200, Michal Wajdeczko wrote:
> We have already started using few KLV keys from the 0xF000 range
> that, as we have agreed with the GuC team, will not be used in any
> GuC ABI actions. Add definitions for that reserved range and move
> our migration KLVs to new ABI header.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h       | 17 +++++++++++++
>  drivers/gpu/drm/xe/abi/xe_driver_klvs_abi.h | 27 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c     | 14 +++++++++++
>  drivers/gpu/drm/xe/xe_sriov_packet.c        |  7 ++----
>  4 files changed, 60 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/abi/xe_driver_klvs_abi.h
