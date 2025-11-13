Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371D9CD6E55
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 13:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C7F10E807;
	Thu, 13 Nov 2025 13:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W19d5FXu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443E010E807
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 13:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763041055; x=1794577055;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=ToFW/YP7iSEVnb71zhZpDLxasN/YoApisCzuwT0h2xA=;
 b=W19d5FXuqL7u1oBxGgnCtAuEQSuSOInXpNntXRBWwf+p0sk96oWauXT2
 lWGGnyOls0eX/HSr8vYFPA0A5tU2agDKXPwdBlu1eYCs5mmlvNRI4fUNh
 tmvpEZgjBhTfIOY9TkLlVIcnRMQSmF0WSqhz+YR/NV3YssZcuP+PvoZDo
 4I0OhBwvsF+Wvt3gtRAbq4RJbocZGS7ftIPjqgfC6ysPpvrvsJ2A6b9H/
 jGJe5eHRGGg1hcpbPapjfLIJiDHVHgJ7wrfswB0Y7Lf14ydBfpbSOjUUn
 NK8tyy4CC0cUwBs3Y0OAQCx4SInkg3BVL3+2ukR35DfDr68HKnfAiHcbN A==;
X-CSE-ConnectionGUID: pYG9LChrQAKTgVmHkYuMOQ==
X-CSE-MsgGUID: bgUrQEiGRGaJf7F1G2aJxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64127853"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="64127853"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 05:37:35 -0800
X-CSE-ConnectionGUID: /VbW3pzAS9mkJy5tpn/2bA==
X-CSE-MsgGUID: JrHf7LBBQgGU8hcMTUYb5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="194497456"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 05:37:34 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 05:37:34 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 05:37:34 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 05:37:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xF6FOChOYFDeE6aIr37BVNvzrxUKZ6ChOsYi+uKdT8v+1qrGWhAoC1xuxHGqvhTDtO/jDWeyj3nEcbCC0iNcsIkhNfqtFn2IXxU/K7wM5GdJNqoyQcRm6gqeUNhuzU8VDqD7T+avWGy48jJD4n9EuzBY7L2Rl4e6CvIaDgfokNp1cd32eBvLbLVZWzB0i/XVm3v3UBujqFBt6PoaB9cgj4K5Zn5h/X1Y2JaJEm8KDrfaaV/6x7cEqf+WbkdO0G/bxZZW4JKq2APiqiz4O1MRjuAdWZn5xGJdmvBw1/oCNUdqvBfsJVImUWPJwtAuje7peocVJGwT6N36W8CZ1QnMIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TCqBZEXGvFB+prp0+/PX0jK72npOI8dpi6HbDjntZU=;
 b=FSH/Iv35UmeY8qbkO4QC1jfBKSh+UdGXA7xtZQ6zp8QBT4tZlGxhWS6dxSGkJJKBz2nCEwsPJ5WIcYMprS0uJ91n9utX3XtYqUsHvZ37BGw9t2VYZdjr6stG8gerg7wjNmMQEMdTZmcY7N/XGKU9FdzXW3XLLP0f9jIh65jhMzornaVfYrG8PETCCqYGjeLLZ7txkXi+rRRXELEfMd4/ht2MTPg00mQFsGbvrvsSI3on4MCGmjVsHi+BaSR0LUGVUhMeCzKmHcJPn21+MlZxgvEfG3JoRRCZamlgW7V1LZXEwoP7O8np12djOE/Z0sPO9jCYI+JPDWtfyD+mDtpJKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM4PR11MB6334.namprd11.prod.outlook.com (2603:10b6:8:b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 13 Nov
 2025 13:37:27 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 13:37:26 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-43-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-43-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 11/30] drm/xe/pat: Use scope-based forcewake
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 10:37:09 -0300
Message-ID: <176304102941.3698.12112253020128921728@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR13CA0159.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::14) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM4PR11MB6334:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e57d024-4a1e-45e2-4bd4-08de22b9c8df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkROWjh4RG5weWVnRjljYkQwUGdTbFA3NGJUT1lXSkIybTFMVkVQZ3BGb3RI?=
 =?utf-8?B?M0R5OS94R1FLQzB2WVBMSFRKUTVQQjJwR1pXWHFnait0OEZwa1BhQUZkVGJt?=
 =?utf-8?B?NjliYVFlQ01vblM2SDlCNCtFWHRnY1ZjYW1kVU5PZ0d4QlFQSlowVUxLeE1G?=
 =?utf-8?B?dWh4b2RidUhRK1RMcnZkV1lQZkMxbVhnRnBSelNZcEpONU03UndkYmhVeFJE?=
 =?utf-8?B?NFVvN29URzNCMFppc3hmYTJoVzNNditzQUI2eWsvUWtrNlVoMVE5Z3Q3R2xt?=
 =?utf-8?B?WjBISlRjUXhaNmZTMnZjUXRSQWViTGZBYmhBVDBMakIxdFdJM3RrTlVwSUdt?=
 =?utf-8?B?MERnVlI2ZU5kMlBZYTJFMUNYY2NvdTBkNkcvSWNwZHdLZWhhYUFrRWQ1ZjRO?=
 =?utf-8?B?OU95cVNnWThLZ0JobkgrYTFRM3JuZGVuR055MzFYL3BzVTliM2ZlUjV3Q0ho?=
 =?utf-8?B?WWVvNkVwTE40VnJzTkF4dzBsdWZDMXB2aWo2VkZuNzE3dDRRNTMzNmU5UE52?=
 =?utf-8?B?OWJYa0FqTE9HdEFiaE5KUGJXelhCSXAxVnlldEs2SlprREVySWl0UHFKa2pr?=
 =?utf-8?B?RFFpQUhUVDhpejFDS2tQQ1h3djY1M0tpUENGRWdXSnJYaTRMZy9tTzEzWVo4?=
 =?utf-8?B?MWp6dE80NU5ic0dlandrSU80ZlExRnBHaWdsUkdFVzk0Zk4xbk1xa1YrTGQw?=
 =?utf-8?B?VWVVcFV6bVlwT1BKdHVOZVVaWDhOcWhKME0xY012dmE3dEh3K0hOWUNUYlB3?=
 =?utf-8?B?eHVLdlR3OXR3bUJtek1JVEdGbUxZZkRkelByaFRhbGtQRnJhRC9rcEhwWlJP?=
 =?utf-8?B?S1lLL0pZWGR2QUlSZWdnQXJhbGZjYzJENk4wOXAvM2tQUnpOeHY0bkVoN1Nw?=
 =?utf-8?B?K0lXUXpacUtsLzM2Z1NZQzlGVzh4cGJoRDZ3NlBwSW8zaXY5THZHVDV0STk1?=
 =?utf-8?B?L1FxclRkSlpra2h1a0lWMEp4b1ppcjdZQWYyOGRENlNvR2o3b3BBbGoxbTRY?=
 =?utf-8?B?UWloOVFYWkxxQjVGQ3NUaGViREp3Y1RuT1A4YWg0M0hiZlQ5L0hWYndNSWYw?=
 =?utf-8?B?ODMwblIwMzZ1MW5IVk81UURVaWJMRmhNY2Z0cGUxMkkvRGxRNUoyTHRVQXFJ?=
 =?utf-8?B?ak1kRTNOejVJYVVWbTZCeFhVbEQ4VG5HVGJHTFAyVE52TEJYSUI0d3ZKdlFi?=
 =?utf-8?B?M1ZmZllwUnJDbSt6aEh2cHV1REZ1ZTFtVWxWZ1NHNDNlMFpycW5jU2h4ZjA1?=
 =?utf-8?B?Sk92VEE2eUJsdkNqUEpZaXRLaFp0ejdEUEhVT1Rma1ZyQzAvMXV1dnVnZVNX?=
 =?utf-8?B?eDZNSlFUT3c0OVpQVkhDWjVoMnpBbDIrUDIvaVJHUFc3SXVyTHdPSDhJMTlN?=
 =?utf-8?B?MlFPWmx0L1lISnBkNFB4amI4bUpMVHFRYUcyRlUwSzZ0aEhBV2dWS2d5YVhJ?=
 =?utf-8?B?cUlKYVVvQ3pJdDB0WFNnNmNHNld0dmgwUlNBRGM2NUVkdmppSUk4eC9MQXNr?=
 =?utf-8?B?ZnNYZGp5WWErQXQ1Zk03czlMUFpZTnZoT0dubGFqR1dmUHhpcnNpVC91WGlG?=
 =?utf-8?B?V29weC8wTktHTWg3VWRFaDdHRVpaNjN4ZjkrT0RxdzdMbjcxaGFlNGV4aWcv?=
 =?utf-8?B?N1E0VlM3OW9WMG5EcVpEQTR4VkVXendJdmdJbmZtNERQREc5RlpTNFRsclFB?=
 =?utf-8?B?RnpZVkZTaXJLM3FHU0RiM3Q5TmxvSlVsMmo0VVY2MFJnL3psdU1od1RJNktu?=
 =?utf-8?B?RnZIQU1ybnFiQm5zSTRhSW45KzdRakEvRWN3dWhMVForUnlyS3NRaGtrOTZy?=
 =?utf-8?B?M1doSnU4VjNYaHVKSHJVTnd1a2Z4K0dwQTBRUlhVZmFVUy9NbHJWMlZlazJJ?=
 =?utf-8?B?SnVVRnNyTmpyN2lmR2JUN05zL1hwVlh0MDMreTIyNHo1S25oczJIQ1pxekU1?=
 =?utf-8?Q?Ts6WC/UD8CbMecTpidsaW0iaZv2nrll5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2ZFQ1Bha0JGZTRCVmpiSXNod0RiZUVVbGh2TkRUVjBHUW9jS1c0ajNheEI1?=
 =?utf-8?B?NzVsOTJGcWtwQnBjNG9RTEtCZWtZam9Zc1JiYmFpeTlqSXlEbDVodytHdGFC?=
 =?utf-8?B?Y3RSQ21sOExkMmhxa2l6OFMvbUN4VUR6Z0pOTHgvdjBtQXhZZ0s0VkVkVERK?=
 =?utf-8?B?VzNnd3NWWFhMVzdoc2IwcWVrYWExVEg0TTFVQkJ1dEZtR2kxY1p5a2YxeXZp?=
 =?utf-8?B?eE9oc3R2MzNNM2dLRE9UWUpNdncyb1lZWDViSnlEZFZOaUN1YWtRRlRobHB0?=
 =?utf-8?B?eDM1ZHA0VnczVi9BU1cyOWY2YllzK1dzc09ROWJQblY0M2daSlRVWUI2VlY5?=
 =?utf-8?B?ZlMrVVJvanc2VlFxU3BWRERxY2tIN3RQamwyZmJnajRqRGZJSmF4VWlBRU1H?=
 =?utf-8?B?YmpxNkg0RHVia0ZBanRjdllkNXU3TVZTdHlVT0p6TU1PSVgyUW9nYnpWeDQz?=
 =?utf-8?B?ekgzdzdZU3BURDBLWnc3LzJXRmh0V0tlTDhNalpCOWNlWHdNcHg5bU5sRWNF?=
 =?utf-8?B?U1RqcisxV0FlYUlYcHpWMUtiNFZkdGxobTRnVytsc3JXYlJSdXRoV2xmNk16?=
 =?utf-8?B?Z1ZMK2JxT1ZGNVhLWThaakdPeExnU1dielRtT0xFOEtuVHlybjhISjVab3pU?=
 =?utf-8?B?NmRmdVc0L1JQM1J3TmNMTTFTSStXOURDL2NuMnRsMzRBSUNsM2RMU09rUUtL?=
 =?utf-8?B?SmlISTlJdEo1T0JqcSt4YnNoOHB2OUVta3loUjQrejNLWmkzQnQxNlRaRHdD?=
 =?utf-8?B?MWhZZ3IxdWExUG1WV3ZuTzJjRDUyMWlHb1Zrd3M3VEV1TUluaWJ6L2Yyay9v?=
 =?utf-8?B?eDlrNG1nVVVvKzVxNWRYekxLcE9zMmRxOGNoU1FmeUdGZ0I2cTRXcmh5NXhV?=
 =?utf-8?B?R1ErWnlQek1lMkFhTVduK0U1b2lLaWVxcksrd0xuc0RZMDQ0R0h6REJkeE1w?=
 =?utf-8?B?WlMyK0dwRVY5L2JaQStpS1N3SlFPRlFNbGZ5UmpXUTNtOEhNTDhPTFYrQ2tJ?=
 =?utf-8?B?aitlK0JNbTZQalZXS25IV295OUtocC9IRXA5Ymtielhpd2lSSytNKzJacU9m?=
 =?utf-8?B?TzJKeXE5ckFYdFlFUHd4U1M0RCtXRWxSa3pHQnhFMkxXOUQ3c3ZhRzJUV1Z4?=
 =?utf-8?B?K0E4RlQ1eUg1NHZtUHY4WGtiTnd6aTBLMFFMQmZqb0Y4anh3UHJBakZBaFFF?=
 =?utf-8?B?bEVYSGh3RFFlR2ZWNHUxVzhEcU4yM0ZtWlBCZ3BhZjNkZHZzcjg5OXhJMDJY?=
 =?utf-8?B?L1ZhTkFiZmRFS0xiSGxVVTU1dHNKeVIzakF2NUQ4RmF3ZmtwRHNFWWlJQ2lL?=
 =?utf-8?B?TDhCekoyYmFad2hZRVRudTI0ZG02a1ZGSE9DVjVxUUZHVDhVN3dQZDArS3Bt?=
 =?utf-8?B?Q3QvZ05UaDQ2V01CL1VpSXpvT2RwMHdjaXEzaUlFS2pwakY3bE91R21QOXBG?=
 =?utf-8?B?NU9vblRnd1dDWktnNHV5VHJQWnFKK0pDS3hDcWtSSXVETDJRVXB6bDRHUlFO?=
 =?utf-8?B?SFllNTVVRUY2RkRPNWF5cjdzVkpkT3ZCVHhZWUhhdWxReTdpVEx4ZzJvcEY0?=
 =?utf-8?B?MVpMTGs5V1BkcXRJSUFQakVnSklTOGpqQzkrYk8zQll3WkZQT24vMlMwdlgv?=
 =?utf-8?B?a24vcFFXMW8wRjhnS3ZpdDkrODNxU01NY2s5ZXJSak5LZTc0eHRXWkZlSEVx?=
 =?utf-8?B?UFA2Nlh2NFRUNGFtd1Jnb2V4OFBXcXNVRG82MWpzN2Nvb2U3QTRIZ1JsVW02?=
 =?utf-8?B?TGloUlhiNVNGODhkM2FXTTNuTjFJaVhMSTFncTFES25GSGJzaG9tQ1lvbE9i?=
 =?utf-8?B?VTRGOFZRaGFNVS8xSjBES0FlWmhKeVVPQ2VxUVc1K05zU2lFeng0eXVqaVNN?=
 =?utf-8?B?b1FPUVdQK1lpUkF6Yzd2OGg0RjZyL3JleE44emYzTzcvNnRQQytvSzgxdHRR?=
 =?utf-8?B?NnNIZlRSd3EvcENRaUpIS1VQbEpzaXBWQ29ma2M4NWtUNFNxUXpMcHNkaGxO?=
 =?utf-8?B?dFpqVlVsWXJqcmFLbXpNVkpHOC9MeFhFYnhRT3BXWnI0MndNYTdRN3hpZTR2?=
 =?utf-8?B?QnFNU05zZnZsMDhRSlM2aS84c1Z4Qlg3eFd0VFltSGZGKy9kUUpWUjc2anBJ?=
 =?utf-8?B?ZnYyN202RjAxTjljTEQ3VHIrSmJUMUZvU0ZKK3FuS0duenBOemFiQnFmeWZn?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e57d024-4a1e-45e2-4bd4-08de22b9c8df
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 13:37:26.8848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Imj3wgmfioYrzhq3syeHpE9qYQGQGCs/n+h2lPfeNWmG4aVRjFz3Vo08yoNGUBPUGYnNjyKkxc49du+a7IsF/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6334
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

Quoting Matt Roper (2025-11-10 20:20:29-03:00)
>Use scope-based cleanup for forcewake in the PAT code to slightly
>simplify the code.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_pat.c | 36 ++++++++++++------------------------
> 1 file changed, 12 insertions(+), 24 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>index 68171cceea18..97b5e995f7d7 100644
>--- a/drivers/gpu/drm/xe/xe_pat.c
>+++ b/drivers/gpu/drm/xe/xe_pat.c
>@@ -233,11 +233,10 @@ static void program_pat_mcr(struct xe_gt *gt, const =
struct xe_pat_table_entry ta
> static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)
> {
>         struct xe_device *xe =3D gt_to_xe(gt);
>-        unsigned int fw_ref;
>         int i;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-        if (!fw_ref)
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+        if (!fw_ref.domains)
>                 return -ETIMEDOUT;
>=20
>         drm_printf(p, "PAT table:\n");
>@@ -250,7 +249,6 @@ static int xelp_dump(struct xe_gt *gt, struct drm_prin=
ter *p)
>                            XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>         }
>=20
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>         return 0;
> }
>=20
>@@ -262,11 +260,10 @@ static const struct xe_pat_ops xelp_pat_ops =3D {
> static int xehp_dump(struct xe_gt *gt, struct drm_printer *p)
> {
>         struct xe_device *xe =3D gt_to_xe(gt);
>-        unsigned int fw_ref;
>         int i;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-        if (!fw_ref)
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+        if (!fw_ref.domains)
>                 return -ETIMEDOUT;
>=20
>         drm_printf(p, "PAT table:\n");
>@@ -281,7 +278,6 @@ static int xehp_dump(struct xe_gt *gt, struct drm_prin=
ter *p)
>                            XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>         }
>=20
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>         return 0;
> }
>=20
>@@ -293,11 +289,10 @@ static const struct xe_pat_ops xehp_pat_ops =3D {
> static int xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
> {
>         struct xe_device *xe =3D gt_to_xe(gt);
>-        unsigned int fw_ref;
>         int i;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-        if (!fw_ref)
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+        if (!fw_ref.domains)
>                 return -ETIMEDOUT;
>=20
>         drm_printf(p, "PAT table:\n");
>@@ -310,7 +305,6 @@ static int xehpc_dump(struct xe_gt *gt, struct drm_pri=
nter *p)
>                            REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat=
);
>         }
>=20
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>         return 0;
> }
>=20
>@@ -322,11 +316,10 @@ static const struct xe_pat_ops xehpc_pat_ops =3D {
> static int xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
> {
>         struct xe_device *xe =3D gt_to_xe(gt);
>-        unsigned int fw_ref;
>         int i;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-        if (!fw_ref)
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+        if (!fw_ref.domains)
>                 return -ETIMEDOUT;
>=20
>         drm_printf(p, "PAT table:\n");
>@@ -344,7 +337,6 @@ static int xelpg_dump(struct xe_gt *gt, struct drm_pri=
nter *p)
>                            REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat),=
 pat);
>         }
>=20
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>         return 0;
> }
>=20
>@@ -361,12 +353,11 @@ static const struct xe_pat_ops xelpg_pat_ops =3D {
> static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
> {
>         struct xe_device *xe =3D gt_to_xe(gt);
>-        unsigned int fw_ref;
>         u32 pat;
>         int i;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-        if (!fw_ref)
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+        if (!fw_ref.domains)
>                 return -ETIMEDOUT;
>=20
>         drm_printf(p, "PAT table: (* =3D reserved entry)\n");
>@@ -406,7 +397,6 @@ static int xe2_dump(struct xe_gt *gt, struct drm_print=
er *p)
>                    REG_FIELD_GET(XE2_COH_MODE, pat),
>                    pat);
>=20
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>         return 0;
> }
>=20
>@@ -419,12 +409,11 @@ static const struct xe_pat_ops xe2_pat_ops =3D {
> static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
> {
>         struct xe_device *xe =3D gt_to_xe(gt);
>-        unsigned int fw_ref;
>         u32 pat;
>         int i;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-        if (!fw_ref)
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+        if (!fw_ref.domains)
>                 return -ETIMEDOUT;
>=20
>         drm_printf(p, "PAT table: (* =3D reserved entry)\n");
>@@ -456,7 +445,6 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_=
printer *p)
>                    REG_FIELD_GET(XE2_COH_MODE, pat),
>                    pat);
>=20
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>         return 0;
> }
>=20
>--=20
>2.51.1
>
