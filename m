Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65146CF9C69
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 17:52:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1685910E8EA;
	Tue, 24 Sep 2024 17:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L8TspaJx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB7F10E8E6
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Sep 2024 17:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727200364; x=1758736364;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=NWLLY/LQW8/3ai8ZTvXCJyz0+Pp4V7So+qosYlHfoqk=;
 b=L8TspaJxY3v9QcaDh4OuV7AuNB+y2vGMKP7seRW74a425dLCG/WL1ady
 BLPUTyEWH3BRZ7iRkCN6/y6o7hBUON73M5abdMVA88ckUaANv3qRFgQui
 RhWWx9/A8Mpa2XSBuI3gE8yIT+/+Nwes/d2Ol5Y76aTDHR4VDo9GdNmKi
 yW9+An9qdcLOJ+4C0h8Kolmy13PcIVdU0Fc9Q/ABO+Zp1AwSdWznmpuKT
 G9hcdjXoyKQks/DT3nbFXCh92eKHK/Em/Wto6FENk34BVkE7BRCp1h34z
 1hDt5ZtfWC30dqPfEI26siizUoXnrYK2spW+Mk+AAH1hmWHP4gidcsoQX Q==;
X-CSE-ConnectionGUID: BVqKghXSSuqdHcp2maZjZg==
X-CSE-MsgGUID: ary4o23SQw+motnvwGI2GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26085493"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="26085493"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 10:52:40 -0700
X-CSE-ConnectionGUID: ssCr3zg2TKCzbWy2ELgUcg==
X-CSE-MsgGUID: Z3QU8wenTIWtRvHllU8WtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="76286948"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Sep 2024 10:52:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 10:52:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 10:52:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 24 Sep 2024 10:52:27 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 24 Sep 2024 10:52:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EBabS/qiF2nU8TgTRQoBA2R/3XMTDUjRAyUpZihlS/Uxr5GnG5jmQZc19/qMbtKrJVjMSif5WZAWfJJue0ev9xro+AwnCIw7HaAASR2uBL92BXHMH/YlzVPRO1i74UAoHoumPBgLkx7uTRjEfJucDxjM13zc5KqJrR310cyMlV48f7O0z9C2ipLO/MEzzp3BauN9OyimYrqilx8VQPNc5Kco/WiXh7mxjQrQl/gPmf+kc1TbnaDdE2JwA2YZ1JYHuYmdibxLIhDuQANUqWcEcbhOGCMCJEo36LWObmYHGIEiwm4d55+Z7dQ6gT/lhZvl4jYnufj+dNGHYBlfLK4meA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Vp6Cw3ZE14bJu/aYUSUl32CoZ4mSBwUOt2xGvuthts=;
 b=eVnKFhgggIxETHHoPEIX+4hV/NgXw4kaL7Yrc17AqTAsN58wQRP+TVssK/4FohKiMkgjnic+6u/8gxS200psjz92QE3D7WTn+3bHihFcI297/T5qWZIL+lh7a8r1Lz7iktA4yhMeacZvBm03+oAb9DBmBumb1iVbrpQrzKyBwXhdBDcW6WWZ183zuawJTKfz1aId/UPCE1NcYpyJAJy5yCnSdqrEuBJT2/yXJJ+wBXCGgArvckqX93UO6bgf9/C0QIGozfBBO/kqxvk40lJBXaqsYg6ipvcPpaC0P7DO0JcTD6f35pMqCa+MZuHfW/DBbof9i5i2To12V8OtZGUdqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 by MW4PR11MB6570.namprd11.prod.outlook.com (2603:10b6:303:1e3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Tue, 24 Sep
 2024 17:52:23 +0000
Received: from SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88]) by SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88%4]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 17:52:23 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240923214514.2031410-2-matthew.d.roper@intel.com>
References: <20240923214514.2031410-2-matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Move IRQ-related registers to dedicated header
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Tue, 24 Sep 2024 14:52:17 -0300
Message-ID: <172720033707.2700.3885917249422383398@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0112.namprd03.prod.outlook.com
 (2603:10b6:303:b7::27) To SA1PR11MB8280.namprd11.prod.outlook.com
 (2603:10b6:806:25d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8280:EE_|MW4PR11MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: 132e45bb-edca-4e12-00a0-08dcdcc1a4c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZStVV3pYcEFzaWdyMXlqS256bEc1eXVTT2prWFNndmdyT3lVWEhpVkNhQlNL?=
 =?utf-8?B?NWhYcGZ4c2lIOHh4d0NQbTQ1cjEwT3JES0xyNlRKdmM5UXVRTVFPSDVPMnVo?=
 =?utf-8?B?cUpoeEFRVmJtNndJU3p5VnpnSS8yYjJkNU1ac1ZhNDMzckxQOGRIOVRNVXUy?=
 =?utf-8?B?RjcyMnA0U2JrTjI5RDFhRzdLa2tWMC9KMUhtbmUrUkdxUjdFZEhrWHI3MXJn?=
 =?utf-8?B?S0Z0eFNleHdIQnZSRTIxTzNMK0dvZGRuUTF4K2Zsc0VLcWtLblJIQnU4QUlJ?=
 =?utf-8?B?cFNsZHByeUhxNG5pUGhEbFQ1T3A4UEFralRGN0pJd2l6Z2llZk1OZ2xOQXFS?=
 =?utf-8?B?L2REblJLZGtzQ1llMW1PY3d0bzJTRFpBT3JoMk04blJPeEdYVG1pYkdzM29V?=
 =?utf-8?B?OXVWMXFweW9SaXVaRUZobEJJbVNTcFVGV05NUGFLbjA2YWx3ek5tR2svZzFn?=
 =?utf-8?B?cVg2U0w2b3J4TlpoY3k5Vlpua1JFRGpUbzRnaksxRW56eHpFN04yWWJ4Lysw?=
 =?utf-8?B?bStkTDVTWDVDTVQxMkp5SkxEUk9CQUdmbUF6aVl6dTBSLzlxUkpPdHZLMFhR?=
 =?utf-8?B?R3JDUDNjMkF3QlAzL1R0dElQeGpwOUNnV244dlJ2M2RabFZuT2pNQmRuQXBL?=
 =?utf-8?B?T2VMOFNXMExEYURvUVFvcVIyUlA2Yi9oQTZ4MlpabXloWElUSDR0c2RVeWpZ?=
 =?utf-8?B?eTk2UDFLRXlJV3VqenRkNXZ6UlFocjU3bUl1UUQ2Z0hqUGVQUTdFL3V1cGFx?=
 =?utf-8?B?Q3FPc2w2aDhMVkZLSGE0bmhiamRtZHprM29rZjNrVEVkVXByWHV5WWlSNnBQ?=
 =?utf-8?B?MktReEFIdHR2SWk2Y3JSbWFjOXcxMjhaMTJVdlVLdnlrTi92anYxUjVjMkhU?=
 =?utf-8?B?ekhzQmRBaE1hVTI0d2VycHBUNHlxbnRlQ1JrZ042U21SN29naTRldnJncUpJ?=
 =?utf-8?B?TDd6WEQvdlJsOGRBMUtDUnk0MlBlb3Z3Q2V2MFJrUWVKS1ZSdWlIcEJydjRt?=
 =?utf-8?B?eVhoTXBCTDhmNmVzalRLdUVQVmxWZzVaRlp4dGtjUVVsSk51b0VtYk10Q0JX?=
 =?utf-8?B?eGpOQTEzQ0g3alh2aE52RWJ2RURnVjJOMVd4cTArZkphbWZhVkEyNklKSkdL?=
 =?utf-8?B?bUIrbm9sV1llVHdHVDlsWEl6dktabGNrNEcvck92b3RaQ1haRkJFSkhWTHZi?=
 =?utf-8?B?YzdNSVd5OTdkelllRCtISFlMa1k1TG5WdFc0TWJtRzk2WjZxREc0ZERwa3RO?=
 =?utf-8?B?U3hneWFITXJFNzFPN1hSem1OdEZEeDdtZkdJbmJnK0NybnBmbEVDT3Z0aE9W?=
 =?utf-8?B?K2hBUnB5dzRUa0FrVlovTi9GVWlCTnRSSXduQlAwUzRWQUNiWnNJMWRFUDVQ?=
 =?utf-8?B?UGt3TExGL0FXQ0gzN09NUVdobFhyN1ZPWWZ1Q1dTN2hCM0lCOEROd2RoVEMy?=
 =?utf-8?B?SlRnTngwNS9nb1h5YnN2SHdMbWZ1U21qSFVhMW9Zdnpib0FjVmFodE9kbmRP?=
 =?utf-8?B?VW90eG5SOWxDNmlWMVRMQjJ0WXVsRm1FL0hrYjl0TjdqbmREUjJXS0JNV1pC?=
 =?utf-8?B?d1ZSY1lVUzFNWndZQVk5SG9KeklTZ05zZnREbW1kTTlTZ01NTW9LREhObzMy?=
 =?utf-8?B?azJHYkJ4V2Z1UjRTOXVWbWtXMkpJSEphK0ZoamVhR1hCMjFXUkI5c1F3OGg0?=
 =?utf-8?B?ZTJTYnhBQ2lNalludUV3ZnJYM3BoRkY5REl5UmhpN1hCTXZHbkZZMVNPaXNq?=
 =?utf-8?B?SjNXTU4wemxFSVRnN3AwT1VVOFpXMDZMQnNKNmRhRS95RVdzdkZBQklKZFNj?=
 =?utf-8?B?MUxQK2xzYjVzdmJKL3Z4Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8280.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnA1aHBDUkJDL1o2ZFlqcTRQME9PTFFqcXh0d3FIVkFmZ0xWMzFwYURFeHlL?=
 =?utf-8?B?SGlCeXpudnptdktrb2VPOSt3YnNjQnBub0M2NzhmaVVEdkM2cE5zUUwxOTF2?=
 =?utf-8?B?OWJyWVRJMGJIMU5Hb1dYQm1YL2RWU010ZUZBNHZhS3E0OUVybXV4cWtjNThH?=
 =?utf-8?B?RDhwRGMzV2RSZk8rUStjQmpPYWpTdW9ETzE0V3REbnVQaDVHNXJOYTQ0azNk?=
 =?utf-8?B?WHIvSW95Q2VvS2xtS0I4RXpJZll0bS93T0NEQm1iZzRaMFFBZEdHRzNsUktG?=
 =?utf-8?B?VVJhQiszVU40bUVLME5ibFJ6dWw0NU5qU2s1ZXBWWS9HMzFPWDZkYVhxWFBF?=
 =?utf-8?B?MGZROVRJN1NUOFhrWXhSdkJvZnI1WkpVelBzazZSZWVyVzEyZFVuVU1BYytl?=
 =?utf-8?B?L0tYemhzK2R2YmdKd2k4QTZDdVdYczBBdnorRVFIRW9Gd005dHVHSHMwcVY0?=
 =?utf-8?B?RFoyaXFsWWxyMTFWbkhtOENMS3psRk1zbVl0c1JKd05XRDhYY1R5elZlL093?=
 =?utf-8?B?RXpqZ0liemdxdGIyYlYrTWJUanlWMjFndlRlTWsyenNZNE4xNlo5M3kxQU85?=
 =?utf-8?B?UkhBUmU5S002d3JkOHVKcmtxN0JnQVArTllPaVA0YmhJZDlqcnRDTlBRL2o5?=
 =?utf-8?B?ZUZJSEUvczVSRHRta1V2RHU2MEQ0ZjJCRXBxaEtISHgramNJSWh3MWF5Zk43?=
 =?utf-8?B?YTFKbVZNaW9mRm5xS3NQWWtoKzBVTDVydDYvcEJNa0lZbGcrNythRS9NVkFm?=
 =?utf-8?B?bTlob2F6SXJueUUyN1NORkRMZGdrK2ZZb0xCdEhOZXErTXRuTDRDVHJqSVJk?=
 =?utf-8?B?OUZPV2xNQmp0eFgzaFQzd21oNktUd1JZV0ZGOVVWS20rL2ZNNiswYkg3YmIw?=
 =?utf-8?B?TVh2dGk1ZEhFT2EyMStCNmFzcjZpZ1NnbDAyV3ZkM2toT0srcWI3ZUxYMHlj?=
 =?utf-8?B?YjFOc05WRW1FMUFHT2lzd2tMN0c2UFhnVjIrdGR5WjJYNnhhTmlkdWJjTjN6?=
 =?utf-8?B?bG1kL1daKzZ0ck5SWk5MR1BUSUd6TndQT1hhL1l0a2lvcjNob0dsMldXR0tw?=
 =?utf-8?B?SzB6QlVkTk4xeTBsRzZwY0NKNjI4aHcxZjBMRGJiT0JzdW9WRXgzbXBTS09O?=
 =?utf-8?B?RXU4Z0o4WktQUzBPRGpJMEhSTlNtalFVaDE4RjZadW9tOWtQSlJIMWtxM0VE?=
 =?utf-8?B?Qi8xMEt2VmVFWEx6OXM3WTdZVk1VN2dYdlpneGVCVGRrT2g2NWs2TWpET0tP?=
 =?utf-8?B?WmhBNXNmTm9GL2ZIN0lUa0FPRDFNSm40Ujc4TlFheW9Bc0N0aXNSQStkR1lh?=
 =?utf-8?B?NUc5WU84RTVsNUFYNjlkVzBYVmZadlN0eGJPQUJTOEdSRksxdnY5OXlMa2pU?=
 =?utf-8?B?aUlWOHoyTm1jNnVWQXBXckZTRFFLb0xRNVJvTlZESG1nSUEzY1ZYWXNQWHV4?=
 =?utf-8?B?VWV5YVJLQWdhdmJYWFJaMTBqZFBuUVNTL0xUWGt5ZUJWVlk5cUExU2pzbGRs?=
 =?utf-8?B?REpjZ3VPRm15NVNMWVRPc0V5R2Vta1o0anBDMmhQMXNOYmdyZVVlZFR5c3J0?=
 =?utf-8?B?cVNLQUJuaGdXT3QxcU85UkF6ZnhGenl4eWQ4VkZDZkVJeVRJdENJZjhmanNO?=
 =?utf-8?B?YkpYTDEyNmtoTWp3Mk5tSlg4V1F3Q0xpa1JrNi9YdUl5R3EycEhpUXFjcWFL?=
 =?utf-8?B?RHFDMS8zeHNwS2cvcldiekpmQ1ZsUHFpaUdzZHV2eHF4dWZOb25WQVhzaVd0?=
 =?utf-8?B?bzhUblE5Y2x4YzNWV05xMzhDdW9qWVRBWDFkdXBuK2V6WFNpbUtzNm9PaTUw?=
 =?utf-8?B?RUNJLzZBNnR6RkdxbW0zOFY3NHFwS3M2WmJUcnY1bU1md1JqU1R1WVVYRGh0?=
 =?utf-8?B?dWZuSjFUZm0vVFRvMHpjT0xFUU5UTkVTQTB1eG9WY2lLcnFWM25QTitvS0hl?=
 =?utf-8?B?RUJzNzgzQ2swTC9aTmwzR1QremlqQWE2Zm04ZHZYNVZQblArVUhPa3R6dTJR?=
 =?utf-8?B?K1BCdG03OVRFVHY5YzZIalRLR01Xa3oyd1FidHJzOWpiaVJoTnBleWd0Qkxp?=
 =?utf-8?B?N0dWVStJV2NOV1g4emw3Z3lTc0RmcnUvdWJhVG5LdVIybDBrdW1OaTlMdCtZ?=
 =?utf-8?B?MGxONFpzOGc1YzM5WUVPN1FTWllrYXcvL1ovdGRTbXQ0YzI3Z2Q1MENOL3hX?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 132e45bb-edca-4e12-00a0-08dcdcc1a4c6
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8280.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 17:52:23.2092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUjqvrJVHAOBkv8noFow5XvVTESmU/OQ3jXxzH/4TmALcG16jfrMZ+L/zSc/PQ4TH09jIJQA2rBqtjiIpYOuZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6570
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

Quoting Matt Roper (2024-09-23 18:45:11-03:00)
>IRQ registers have a well-defined scope and make sense to collect in a
>dedicated header file.  This also reduces confusion about the GT IRQ
>registers --- even though those registers relate to the GTs, they
>actually live outside the GT (in the sgunit) and thus do not need to
>worry about GT-specific register concepts like forcewake, steering, etc.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/display/xe_display.c |  2 +-
> drivers/gpu/drm/xe/regs/xe_gt_regs.h    | 58 -----------------
> drivers/gpu/drm/xe/regs/xe_irq_regs.h   | 82 +++++++++++++++++++++++++
> drivers/gpu/drm/xe/regs/xe_regs.h       | 14 -----
> drivers/gpu/drm/xe/xe_gsc.c             |  1 +
> drivers/gpu/drm/xe/xe_guc.c             |  1 +
> drivers/gpu/drm/xe/xe_hw_engine.c       |  1 +
> drivers/gpu/drm/xe/xe_irq.c             |  3 +-
> drivers/gpu/drm/xe/xe_memirq.c          |  2 +-
> 9 files changed, 88 insertions(+), 76 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/regs/xe_irq_regs.h
>
>diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/=
display/xe_display.c
>index 5cbee5040e91..ca00a365080f 100644
>--- a/drivers/gpu/drm/xe/display/xe_display.c
>+++ b/drivers/gpu/drm/xe/display/xe_display.c
>@@ -4,7 +4,7 @@
>  */
>=20
> #include "xe_display.h"
>-#include "regs/xe_regs.h"
>+#include "regs/xe_irq_regs.h"
>=20
> #include <linux/fb.h>
>=20
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/reg=
s/xe_gt_regs.h
>index cf21de3adca6..a2e815251068 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -556,62 +556,4 @@
> #define GT_PERF_STATUS                                XE_REG(0x1381b4)
> #define   VOLTAGE_MASK                                REG_GENMASK(10, 0)
>=20
>-/*
>- * Note: Interrupt registers 1900xx are VF accessible only until version =
12.50.
>- *       On newer platforms, VFs are using memory-based interrupts instea=
d.
>- *       However, for simplicity we keep this XE_REG_OPTION_VF tag intact=
.
>- */
>-
>-#define GT_INTR_DW(x)                                XE_REG(0x190018 + ((=
x) * 4), XE_REG_OPTION_VF)
>-#define   INTR_GSC                                REG_BIT(31)
>-#define   INTR_GUC                                REG_BIT(25)
>-#define   INTR_MGUC                                REG_BIT(24)
>-#define   INTR_BCS8                                REG_BIT(23)
>-#define   INTR_BCS(x)                                REG_BIT(15 - (x))
>-#define   INTR_CCS(x)                                REG_BIT(4 + (x))
>-#define   INTR_RCS0                                REG_BIT(0)
>-#define   INTR_VECS(x)                                REG_BIT(31 - (x))
>-#define   INTR_VCS(x)                                REG_BIT(x)
>-
>-#define RENDER_COPY_INTR_ENABLE                        XE_REG(0x190030, X=
E_REG_OPTION_VF)
>-#define VCS_VECS_INTR_ENABLE                        XE_REG(0x190034, XE_R=
EG_OPTION_VF)
>-#define GUC_SG_INTR_ENABLE                        XE_REG(0x190038, XE_REG=
_OPTION_VF)
>-#define   ENGINE1_MASK                                REG_GENMASK(31, 16)
>-#define   ENGINE0_MASK                                REG_GENMASK(15, 0)
>-#define GPM_WGBOXPERF_INTR_ENABLE                XE_REG(0x19003c, XE_REG_=
OPTION_VF)
>-#define GUNIT_GSC_INTR_ENABLE                        XE_REG(0x190044, XE_=
REG_OPTION_VF)
>-#define CCS_RSVD_INTR_ENABLE                        XE_REG(0x190048, XE_R=
EG_OPTION_VF)
>-
>-#define INTR_IDENTITY_REG(x)                        XE_REG(0x190060 + ((x=
) * 4), XE_REG_OPTION_VF)
>-#define   INTR_DATA_VALID                        REG_BIT(31)
>-#define   INTR_ENGINE_INSTANCE(x)                REG_FIELD_GET(GENMASK(25=
, 20), x)
>-#define   INTR_ENGINE_CLASS(x)                        REG_FIELD_GET(GENMA=
SK(18, 16), x)
>-#define   INTR_ENGINE_INTR(x)                        REG_FIELD_GET(GENMAS=
K(15, 0), x)
>-#define   OTHER_GUC_INSTANCE                        0
>-#define   OTHER_GSC_HECI2_INSTANCE                3
>-#define   OTHER_GSC_INSTANCE                        6
>-
>-#define IIR_REG_SELECTOR(x)                        XE_REG(0x190070 + ((x)=
 * 4), XE_REG_OPTION_VF)
>-#define RCS0_RSVD_INTR_MASK                        XE_REG(0x190090, XE_RE=
G_OPTION_VF)
>-#define BCS_RSVD_INTR_MASK                        XE_REG(0x1900a0, XE_REG=
_OPTION_VF)
>-#define VCS0_VCS1_INTR_MASK                        XE_REG(0x1900a8, XE_RE=
G_OPTION_VF)
>-#define VCS2_VCS3_INTR_MASK                        XE_REG(0x1900ac, XE_RE=
G_OPTION_VF)
>-#define VECS0_VECS1_INTR_MASK                        XE_REG(0x1900d0, XE_=
REG_OPTION_VF)
>-#define HECI2_RSVD_INTR_MASK                        XE_REG(0x1900e4)
>-#define GUC_SG_INTR_MASK                        XE_REG(0x1900e8, XE_REG_O=
PTION_VF)
>-#define GPM_WGBOXPERF_INTR_MASK                        XE_REG(0x1900ec, X=
E_REG_OPTION_VF)
>-#define GUNIT_GSC_INTR_MASK                        XE_REG(0x1900f4, XE_RE=
G_OPTION_VF)
>-#define CCS0_CCS1_INTR_MASK                        XE_REG(0x190100)
>-#define CCS2_CCS3_INTR_MASK                        XE_REG(0x190104)
>-#define XEHPC_BCS1_BCS2_INTR_MASK                XE_REG(0x190110)
>-#define XEHPC_BCS3_BCS4_INTR_MASK                XE_REG(0x190114)
>-#define XEHPC_BCS5_BCS6_INTR_MASK                XE_REG(0x190118)
>-#define XEHPC_BCS7_BCS8_INTR_MASK                XE_REG(0x19011c)
>-#define   GT_WAIT_SEMAPHORE_INTERRUPT                REG_BIT(11)
>-#define   GT_CONTEXT_SWITCH_INTERRUPT                REG_BIT(8)
>-#define   GSC_ER_COMPLETE                        REG_BIT(5)
>-#define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT        REG_BIT(4)
>-#define   GT_CS_MASTER_ERROR_INTERRUPT                REG_BIT(3)
>-#define   GT_RENDER_USER_INTERRUPT                REG_BIT(0)
>-
> #endif
>diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/re=
gs/xe_irq_regs.h
>new file mode 100644
>index 000000000000..1776b3f78ccb
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>@@ -0,0 +1,82 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright =C2=A9 2024 Intel Corporation
>+ */
>+#ifndef _XE_IRQ_REGS_H_
>+#define _XE_IRQ_REGS_H_
>+
>+#include "regs/xe_reg_defs.h"
>+
>+#define PCU_IRQ_OFFSET                                0x444e0
>+#define GU_MISC_IRQ_OFFSET                        0x444f0
>+#define   GU_MISC_GSE                                REG_BIT(27)
>+
>+#define DG1_MSTR_TILE_INTR                        XE_REG(0x190008)
>+#define   DG1_MSTR_IRQ                                REG_BIT(31)
>+#define   DG1_MSTR_TILE(t)                        REG_BIT(t)
>+
>+#define GFX_MSTR_IRQ                                XE_REG(0x190010, XE_R=
EG_OPTION_VF)
>+#define   MASTER_IRQ                                REG_BIT(31)
>+#define   GU_MISC_IRQ                                REG_BIT(29)
>+#define   DISPLAY_IRQ                                REG_BIT(16)
>+#define   GT_DW_IRQ(x)                                REG_BIT(x)
>+
>+/*
>+ * Note: Interrupt registers 1900xx are VF accessible only until version =
12.50.
>+ *       On newer platforms, VFs are using memory-based interrupts instea=
d.
>+ *       However, for simplicity we keep this XE_REG_OPTION_VF tag intact=
.
>+ */
>+
>+#define GT_INTR_DW(x)                                XE_REG(0x190018 + ((=
x) * 4), XE_REG_OPTION_VF)
>+#define   INTR_GSC                                REG_BIT(31)
>+#define   INTR_GUC                                REG_BIT(25)
>+#define   INTR_MGUC                                REG_BIT(24)
>+#define   INTR_BCS8                                REG_BIT(23)
>+#define   INTR_BCS(x)                                REG_BIT(15 - (x))
>+#define   INTR_CCS(x)                                REG_BIT(4 + (x))
>+#define   INTR_RCS0                                REG_BIT(0)
>+#define   INTR_VECS(x)                                REG_BIT(31 - (x))
>+#define   INTR_VCS(x)                                REG_BIT(x)
>+
>+#define RENDER_COPY_INTR_ENABLE                        XE_REG(0x190030, X=
E_REG_OPTION_VF)
>+#define VCS_VECS_INTR_ENABLE                        XE_REG(0x190034, XE_R=
EG_OPTION_VF)
>+#define GUC_SG_INTR_ENABLE                        XE_REG(0x190038, XE_REG=
_OPTION_VF)
>+#define   ENGINE1_MASK                                REG_GENMASK(31, 16)
>+#define   ENGINE0_MASK                                REG_GENMASK(15, 0)
>+#define GPM_WGBOXPERF_INTR_ENABLE                XE_REG(0x19003c, XE_REG_=
OPTION_VF)
>+#define GUNIT_GSC_INTR_ENABLE                        XE_REG(0x190044, XE_=
REG_OPTION_VF)
>+#define CCS_RSVD_INTR_ENABLE                        XE_REG(0x190048, XE_R=
EG_OPTION_VF)
>+
>+#define INTR_IDENTITY_REG(x)                        XE_REG(0x190060 + ((x=
) * 4), XE_REG_OPTION_VF)
>+#define   INTR_DATA_VALID                        REG_BIT(31)
>+#define   INTR_ENGINE_INSTANCE(x)                REG_FIELD_GET(GENMASK(25=
, 20), x)
>+#define   INTR_ENGINE_CLASS(x)                        REG_FIELD_GET(GENMA=
SK(18, 16), x)
>+#define   INTR_ENGINE_INTR(x)                        REG_FIELD_GET(GENMAS=
K(15, 0), x)
>+#define   OTHER_GUC_INSTANCE                        0
>+#define   OTHER_GSC_HECI2_INSTANCE                3
>+#define   OTHER_GSC_INSTANCE                        6
>+
>+#define IIR_REG_SELECTOR(x)                        XE_REG(0x190070 + ((x)=
 * 4), XE_REG_OPTION_VF)
>+#define RCS0_RSVD_INTR_MASK                        XE_REG(0x190090, XE_RE=
G_OPTION_VF)
>+#define BCS_RSVD_INTR_MASK                        XE_REG(0x1900a0, XE_REG=
_OPTION_VF)
>+#define VCS0_VCS1_INTR_MASK                        XE_REG(0x1900a8, XE_RE=
G_OPTION_VF)
>+#define VCS2_VCS3_INTR_MASK                        XE_REG(0x1900ac, XE_RE=
G_OPTION_VF)
>+#define VECS0_VECS1_INTR_MASK                        XE_REG(0x1900d0, XE_=
REG_OPTION_VF)
>+#define HECI2_RSVD_INTR_MASK                        XE_REG(0x1900e4)
>+#define GUC_SG_INTR_MASK                        XE_REG(0x1900e8, XE_REG_O=
PTION_VF)
>+#define GPM_WGBOXPERF_INTR_MASK                        XE_REG(0x1900ec, X=
E_REG_OPTION_VF)
>+#define GUNIT_GSC_INTR_MASK                        XE_REG(0x1900f4, XE_RE=
G_OPTION_VF)
>+#define CCS0_CCS1_INTR_MASK                        XE_REG(0x190100)
>+#define CCS2_CCS3_INTR_MASK                        XE_REG(0x190104)
>+#define XEHPC_BCS1_BCS2_INTR_MASK                XE_REG(0x190110)
>+#define XEHPC_BCS3_BCS4_INTR_MASK                XE_REG(0x190114)
>+#define XEHPC_BCS5_BCS6_INTR_MASK                XE_REG(0x190118)
>+#define XEHPC_BCS7_BCS8_INTR_MASK                XE_REG(0x19011c)
>+#define   GT_WAIT_SEMAPHORE_INTERRUPT                REG_BIT(11)
>+#define   GT_CONTEXT_SWITCH_INTERRUPT                REG_BIT(8)
>+#define   GSC_ER_COMPLETE                        REG_BIT(5)
>+#define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT        REG_BIT(4)
>+#define   GT_CS_MASTER_ERROR_INTERRUPT                REG_BIT(3)
>+#define   GT_RENDER_USER_INTERRUPT                REG_BIT(0)
>+
>+#endif
>diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/x=
e_regs.h
>index dfa869f0dddd..3293172b0128 100644
>--- a/drivers/gpu/drm/xe/regs/xe_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>@@ -11,10 +11,6 @@
> #define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK        REG_GENMA=
SK(15, 12)
> #define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK                REG_G=
ENMASK(9, 0)
>=20
>-#define PCU_IRQ_OFFSET                                0x444e0
>-#define GU_MISC_IRQ_OFFSET                        0x444f0
>-#define   GU_MISC_GSE                                REG_BIT(27)
>-
> #define GU_CNTL_PROTECTED                        XE_REG(0x10100C)
> #define   DRIVERINT_FLR_DIS                        REG_BIT(31)
>=20
>@@ -57,16 +53,6 @@
> #define MTL_MPE_FREQUENCY                        XE_REG(0x13802c)
> #define   MTL_RPE_MASK                                REG_GENMASK(8, 0)
>=20
>-#define DG1_MSTR_TILE_INTR                        XE_REG(0x190008)
>-#define   DG1_MSTR_IRQ                                REG_BIT(31)
>-#define   DG1_MSTR_TILE(t)                        REG_BIT(t)
>-
>-#define GFX_MSTR_IRQ                                XE_REG(0x190010, XE_R=
EG_OPTION_VF)
>-#define   MASTER_IRQ                                REG_BIT(31)
>-#define   GU_MISC_IRQ                                REG_BIT(29)
>-#define   DISPLAY_IRQ                                REG_BIT(16)
>-#define   GT_DW_IRQ(x)                                REG_BIT(x)
>-
> #define VF_CAP_REG                                XE_REG(0x1901f8, XE_REG=
_OPTION_VF)
> #define   VF_CAP                                REG_BIT(0)
>=20
>diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>index 9cb326af5931..783b09bf3681 100644
>--- a/drivers/gpu/drm/xe/xe_gsc.c
>+++ b/drivers/gpu/drm/xe/xe_gsc.c
>@@ -34,6 +34,7 @@
> #include "instructions/xe_gsc_commands.h"
> #include "regs/xe_gsc_regs.h"
> #include "regs/xe_gt_regs.h"
>+#include "regs/xe_irq_regs.h"
>=20
> static struct xe_gt *
> gsc_to_gt(struct xe_gsc *gsc)
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index b6cd5e941f19..c2ddf883702b 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -14,6 +14,7 @@
> #include "regs/xe_gt_regs.h"
> #include "regs/xe_gtt_defs.h"
> #include "regs/xe_guc_regs.h"
>+#include "regs/xe_irq_regs.h"
> #include "xe_bo.h"
> #include "xe_device.h"
> #include "xe_force_wake.h"
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_=
engine.c
>index d7408d06ee20..ea6d9ef7fab6 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -12,6 +12,7 @@
>=20
> #include "regs/xe_engine_regs.h"
> #include "regs/xe_gt_regs.h"
>+#include "regs/xe_irq_regs.h"
> #include "xe_assert.h"
> #include "xe_bo.h"
> #include "xe_device.h"
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 5eb7775c0fd2..b7995ebd54ab 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -10,8 +10,7 @@
> #include <drm/drm_managed.h>
>=20
> #include "display/xe_display.h"
>-#include "regs/xe_gt_regs.h"
>-#include "regs/xe_regs.h"
>+#include "regs/xe_irq_regs.h"
> #include "xe_device.h"
> #include "xe_drv.h"
> #include "xe_gsc_proxy.h"
>diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq=
.c
>index 3f8d4ca64302..e3610cb90bb9 100644
>--- a/drivers/gpu/drm/xe/xe_memirq.c
>+++ b/drivers/gpu/drm/xe/xe_memirq.c
>@@ -5,8 +5,8 @@
>=20
> #include <drm/drm_managed.h>
>=20
>-#include "regs/xe_gt_regs.h"
> #include "regs/xe_guc_regs.h"
>+#include "regs/xe_irq_regs.h"
> #include "regs/xe_regs.h"
>=20
> #include "xe_assert.h"
>--=20
>2.46.0
>
