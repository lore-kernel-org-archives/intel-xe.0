Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F239C83F17
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 20:53:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069D010EA43;
	Fri, 18 Jul 2025 20:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZW+BH9SS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3960F10EA45
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 20:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752872002; x=1784408002;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bcZ2BkK9g2sXOJS2nq05RQkGFlKOFffn2Pm/fNtUPOI=;
 b=ZW+BH9SSPwrbWJg5fZj4urycfpI9FMxph8AUtZ5NH65iOmRIFI9OLZnt
 L/lc64dNkLZ1LCqsRwB3caYhBkv3eFU0D0sdUTvOzPskP0mm1ciiUnGND
 TfLRtNysVZKytfjjymQ7L0XfDc7A1HSdD7hc1LbrEfWk/N1jznEfuuFsr
 glXZ/LVTJbN79aef1jcVm0qDTYWJDoYuaeSYt55kOMc4qYAZF6Gh45kUy
 snW1LKI55uoJSC13jmpHeqEA2DzRMrFWq2AGF33Vd7xJIB9vRDjLz6qka
 V2Dm3NJoHc1QvT6hAij6H/6i8n/XwPHYXAdAMkY1Hisr0Ot6iGSR6G4h0 A==;
X-CSE-ConnectionGUID: sJGSJDrQSaqMNS0UZfhKow==
X-CSE-MsgGUID: h44LIFGlQd+ARYlX0ktKwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="72738419"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="72738419"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 13:53:21 -0700
X-CSE-ConnectionGUID: h6Sp1yENQnSa62gtsysk0A==
X-CSE-MsgGUID: yCN4lfReSR+gFwdotEmiRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="157556830"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 13:53:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 13:53:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 18 Jul 2025 13:53:20 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 13:53:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKggxNU70cOJ9WYpq4ceMiGWKdEzqp65WyeubBKrrKyGwLAOqgGr+Dq6gr5LpiMioAYAsimSs8q6qVxsDe5njfGCX7VIAPbFv4BmlKv3KkWsXmC6Aqgm4RpQi7bwR9QPFWPggtG0eMEMUkct657uWZ/yqNf3TDgGqmxDf5N2eWPVFmyJ1YsCsCfBh3sVb6mA9IokAbheKHE+9x2ErxKS+YttuY+ShRCG50+vfBMwSz1lMvZ3VrXZbNVlnC+vIcwJBQzAiD+n9qrmwRmi36iB2E0avNVVVBy5e+TMYsoedTvtehRDaQuA74ssJzbV3nO50MgLC0PYnWFACANcxkM1aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ES1gXzdlK5v6kDP+irrgVidR8nz1G6ZlC2hKd5qqKZc=;
 b=ckKw/NKkAMBOEva8Puvy4BhRHUwUsokcfq3AUOuWA7JTaQQDuk17hkryAcobe27x+Ozf7Y9nSypR+zqwiQc3LnLAd8nAqN+dS7HpycpI3lNtWLhZ8I2b6nUIDGQUBYtOkpWBQEfsWS36pPCmlMkh48cK1EWPbAf7eflGalQtJ8iw5hmfu+TN7AycN6pOaUAZlCYalg8D4+xgCuQ9ufg11IXM/+Y/9F8qoapavaqRUm0GkhcFol5pELUUx/3c8+ay3L+8b+ZJZKv/tHwygyq+S7pfMWP71q3xy4eag5jBZqIw+QZ7bCBr1CddGM9HI1dlwdZUj+Me9ZQaZZMS5+Qgzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4883.namprd11.prod.outlook.com (2603:10b6:303:9b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 20:52:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 20:52:49 +0000
Date: Fri, 18 Jul 2025 17:52:40 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/5] drm/xe/configfs: Enforce canonical device names
Message-ID: <2ng7elsmpwvcuoamnzgre53agecj2wtmaogmywj3h7skujwhc3@ttapbrk44oaz>
References: <20250717184825.851-3-michal.wajdeczko@intel.com>
 <20250718140519.895-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250718140519.895-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0057.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4883:EE_
X-MS-Office365-Filtering-Correlation-Id: ab59ab2b-cd4d-47b6-13a1-08ddc63d0e60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGJnRDN0NExiTU1sbWpWbGhYNnIrMUlTNFBtWWxGcExBeExldm55UHVkbjNJ?=
 =?utf-8?B?MkNVK3Z1Yllyb0wveGdEa0JiUFBpWXJFZUhoSTFGTTdBTG5DMGVLT09LY1Br?=
 =?utf-8?B?bVFleHREcE01VHF5TVFUOUJ4dE1sMktFWGRmdk9ibExZQVNYdU5DOHMwRWJB?=
 =?utf-8?B?dVdxUGN6YXJqVXBUT1N3R1lVM1Fza25Ba1h3Ykt3Z0FkRGQxOEFUMzZDc2Rk?=
 =?utf-8?B?VlMxNStqeGY1N0JCVk1JV1Q3NG1wdTlQL2I5ejhhSHNQaUswbllaUW5xdmZs?=
 =?utf-8?B?RzMvZ3lUZXQwRksraTVHOTZiM1p1VzBmeGtRaHdYeDZ1cmR5VnZiQnhZdFd2?=
 =?utf-8?B?RmoybUhWRE9ja3NKRytoT2VVUTRFdmZlMnJaTXlCVnoyeHZKQTl5SGpVUEFD?=
 =?utf-8?B?QStIK00zNGU3K0g5Y2V1RjEvNUpUTXlDNVBQZ3RhQ1Q1M25HZnBPSDVicnJJ?=
 =?utf-8?B?Wit4WERFdlN1UjVjbjhqanY5ejBoQ2piT0k2TlUrOTNSMTNoTkk2b2h0Zm5R?=
 =?utf-8?B?eGlIditSb2RRekxhYmh4cURFNVNsbmpXNU50a1l3endkQmkvWWwrWEtzWExL?=
 =?utf-8?B?VHlzTXdKQ3M3MjMrTnVTbGpBZEJiZjN1MGE1ZURRSUxDTlhkSWl0VXE3WkYz?=
 =?utf-8?B?UnVhN2NNdFNPOHl1TGQxL3VEZ1c2M21nK25JVHBPYnUzUzFDQ0prdmJVYUo1?=
 =?utf-8?B?b2h4dnRQUWlwck1yK0hidHVncktqTUtXRHJyRFVnV01sQjZMa2dORWVhNEVJ?=
 =?utf-8?B?S1dpRGQ1YXhUWnYzMkY3ZERtL2dqdWlWUlBneTY5MGN5Y2d1QzVya0tNSDdo?=
 =?utf-8?B?QnMydXRadytNc1dYOUVGQVBXSXVnSHJVVGZWanNkbFA5cXdWQ1hvbHVSUjYw?=
 =?utf-8?B?eHBIS3AyUElGQWpKM2MrS2NLNnE2R3BIdWRoWGpMOUhDTE5UcC8vbFArQ3h5?=
 =?utf-8?B?V2JZUm53NUJyMTdIM29qbEJWRWNEWllmZ1BJeVBaRXZsOE5WSlZCZHgrc2lU?=
 =?utf-8?B?NTRpMHEzZ0sxWmg1UkN6Nmw4dmN5b0MzTHU3aVRHWjFQVVZkS0JKZXNISHlq?=
 =?utf-8?B?ems1NW9Famh0ZGVOckljSndaT2ZOVHNsaXJicGdnZVV4T0dWYXRlT3g3TDl0?=
 =?utf-8?B?OGVxLzY2dTFGTjBPWVpzdmxNNjJDZHNkSWZEZDZHbTl3cDV0Z2RzcEdDZmpv?=
 =?utf-8?B?TDhxVWNaUW1UYWFUMm4zanVpU2MzS3R1aS85YmQ4ZDRmRzNQMlRhWDlXU1JO?=
 =?utf-8?B?Vm5xZ2FRdTB1SEVjeFNBc0lNdXZNaWZIbU9MWHR2c2UwUWY0ckx2K1EwRC95?=
 =?utf-8?B?NW41S3U2UndHa1cycnhVMC9NUGRxeDk2OVNSaXV5eFhFUi8xNnlzV2NsM3Rk?=
 =?utf-8?B?UHAvdm5PK1NWbGhNUm44SEl4bW13MzNGQXY4S0JXb2ZUNXFCZnBkSEt4bTF4?=
 =?utf-8?B?Z1FZNmlqUmpSZEdkQWZtNytER0JOZGZqbmpsaHVYTCt0VG5YSm90TTZNbHM4?=
 =?utf-8?B?cXQzMXR6QUdiRWYveHVFKzdkNnU3QVNQcjluaWVYU2lsMzU3RFpBay9jbU1F?=
 =?utf-8?B?Tjd6UDh3K2lidzZxdEkxZ2tKVW1vOTkrYUQ3L0QvQXk0S3NHYWg3ZWV2dFFo?=
 =?utf-8?B?bFBremNKSGNrQVZaWjZ6Q0JGL2hJSDJFWGRYOGx0a2ZOb2FFNkFOV3VhajRH?=
 =?utf-8?B?MnJZdXA1S0c4REs1cStCMWdmMXZnWmtvS081YTBvRStnN1FXYXJTeVY1Tkow?=
 =?utf-8?B?WHowR2IyU2tnSTJNOEw1dlRQMzczYlNkMm1QckNOek5SdjhCM1UvZmIxWlFh?=
 =?utf-8?B?M082TGUwL3Vtb0k1b09UWFFYYlFORk1NSk9vN0FNNFJNVG45RzYvZFJnWGZ1?=
 =?utf-8?B?Rjk0UlRzWm1MUjhEL0pGejM0RW9rMDE3SGNTeDNhbUFLM3BwSlEzdFdCajJi?=
 =?utf-8?Q?GiYBgumvu5g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlhVOGVyeFNjcytCNTlReFJtaXlWdTAya1d5UWx1bzNOTjVqRmpUYTNvbUhw?=
 =?utf-8?B?aUQvM3lGK29JZGxLMnV3bXlvcjVGb3MxTUFPcUdFWnJlYUhXc3pCdkZ1T1dT?=
 =?utf-8?B?cXN5ZHhRejA4blhHMXZNSG5aUnFxSkoybXdZYUVGRHErKzFoUTZTK0RyVHc4?=
 =?utf-8?B?cnpaM01kNFdFcmYzSnhCV0xIUUJ6alNib21XMmRGK254eUpOSUkxdTBYTXdi?=
 =?utf-8?B?ZWNTZGRuNkorNC84Q0xsS1pyN3pmS25yR2ZqeDRrTlhNK2JSQ0JubVBXR0dE?=
 =?utf-8?B?K0FQVkRDSzdjUDlGTU9WaHBmWmZlOEM5WXExS29JcnFwd2l3NFZZYXQ4TUhw?=
 =?utf-8?B?NlFXd3V1VWJVVitHNnlDWVhUUUFwUWV6TmpBaTlDZ1VXQldUUXJ6YXNIbGhv?=
 =?utf-8?B?dnp4MmJ2RzdaR0ZNOGY3MkYwQlBFQ0VxLzVjdUM3eGpIUEtkcjNwZ1Z3MGUz?=
 =?utf-8?B?bXorMEtBVnRmZkgxeGVFMjBIQnY3ZStBYjRkelNGa0V0bTVtT0k1Sk5KVDdN?=
 =?utf-8?B?b29ZTTJzckpmK1RDczRGSmFZUmtkczBMSi9KMjNxZEFKbFFJRDhTYkl3YzhG?=
 =?utf-8?B?VXRlbTBVSjZscDFkRms5QW9qRno5aURLRFJ3NUc5QVY5ZUgzbXJDZEp2YlBZ?=
 =?utf-8?B?RjFVVVduUmhyR2R5N3N4UnlCZUl4Vm54NzdRZnFjYWI2TlR6VUNVeXZ0eFZn?=
 =?utf-8?B?ZnJrSUMrU1ZuQUFwUXVWaU8zRDlYcWtCT0N3UGNsMHVNZHVIR1R6amg4Uk1s?=
 =?utf-8?B?Vmw0RFdaN2krODdaRU1LMlZ6RW5GY0habUpaV1RDOC9hQU04bkFDbUk4cWEy?=
 =?utf-8?B?bnlJU0ozM2JNTC9FeDdsRUkvV001QmIvVmtVNXIvT0pXdGJZR3ZIeTFNa0c4?=
 =?utf-8?B?YWlTOHIvUjRxZ0ZVQytLVXZGRWp1UlZFRHZEZWtnaEdGc3dnQXJJOGFHMUlX?=
 =?utf-8?B?Zm5wOHliQlMwWStzVWt3eEpESWw4eUFhYWNidDlsWHRhOW9JZHdnQnQwd0cz?=
 =?utf-8?B?Yk05SVFVS0lhakU1enFieGxidVJVTkZDcTJTV1JmekxVQ1pTbVpXTzRZMDFB?=
 =?utf-8?B?NTVYakhudkxMeHg5K3lQYWdwUnpIUTk0OUE5OUNJYThxMEFTdlNobGF1ZER3?=
 =?utf-8?B?bWFJSjZQelk1ZE8rMXZGUUg1dlpsQUlLNjFoWjdwMmpLUTJMdmlSeDVIWGNq?=
 =?utf-8?B?UmNRQzZ2alJ5Z2RqQWtZRFpCZnFIYlBJWEdXTnNzdTZ0QVN2dFEzNE9McDlN?=
 =?utf-8?B?QWl3YjJ3QlRYQ1h0UW9Gd2txOG9XOWYyYjhJSExaRXJrejUwWS9oU0tDVTE4?=
 =?utf-8?B?T3dqTlpKVDg1djN6RXN3cWxORFNWOFlBcmhWQWJTZE5MZHBCblBGaHFCL3Mr?=
 =?utf-8?B?bkhHQ0JIdUdUNTVkNjFUSWEwTGh3QWVxd2ZBRHlzK3hua2U1am0wd1hQM2cv?=
 =?utf-8?B?REh0L2w2S0I0MmNRbEQxeDB0YmpSNEhnYzYwOFlLbHgzd3A2RHIvbVQwUXZq?=
 =?utf-8?B?emRJYVVueG1DYXd1Y1pqcmNOL2ltUUdjYVkvRU1PZzlYNGIzdDFNak5LMWJK?=
 =?utf-8?B?UHhuV1JLTXlkRTlzSHhpWjFtblRoNThFRW5oS3dBM2VndFBHRGRIWjN5cEp0?=
 =?utf-8?B?aURCdE01MTQzOVFHRGNWK0srMG9YeGpLbFFtcmcwZzl0RW0wRGh3QmZ0cWZR?=
 =?utf-8?B?NlBOVjRRUTEwSThOK05DcEVzMDJ5WkJFVjdzbnR2TkN6TFVjZXNiVHE4MjJh?=
 =?utf-8?B?b0tMMFBpc0oralhZbDhuTlp6WjIvUHZGSkJpdG10eUNNTFYrRit0c0hoaGVI?=
 =?utf-8?B?SUVJSHh2cmhPTVMxY0RXRWJ4N2diMkJ4V0FraGZWQmFheTFBWjNyMWJWUlMr?=
 =?utf-8?B?U2lVdWdvc3BpemE4Qk5zc3BaVWZFcVdZVHVpUjVvdHoyTkhXeHArSjhIenBw?=
 =?utf-8?B?MUNFdnFuVTNIdWZRdXFZR3Z6ZzduelhmZTJuUTJ6bXVwSHIvYWdvbUkzVVB1?=
 =?utf-8?B?TUMwbFZjdlNnOVB3dkVQVHhLZ2xBbjVJMGd0dzdrMFRCSzdBYkFNVGIrUFRy?=
 =?utf-8?B?VEpHbWpaelhNbjhMdzNOWGNiSWFRdVdGN2JpdG5VUjVQakE5cS9wQmJmRUE1?=
 =?utf-8?B?REZxcjc2bmtnOS9VMUhEd3Yvb1ZrL2R3N3k0aFJzZ2x1V1ViRnpOOUxySmRs?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab59ab2b-cd4d-47b6-13a1-08ddc63d0e60
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 20:52:49.6509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGM5TbbbTz4wbq3lWUoUKkOE8w3ma0ANbunWt0J2zAg9iXLZcMweFZAhK6xIP65SnhDfhDltf1h2AEzPZmrEDx5dGIAuzgyujmGakHJ/Wrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4883
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

On Fri, Jul 18, 2025 at 04:05:19PM +0200, Michal Wajdeczko wrote:
>While we expect config directory names to match PCI device name,
>currently we are only scanning provided names for domain, bus,
>device and function numbers, without checking their format.
>This would pass slightly broken entries like:
>
>  /sys/kernel/config/xe/
>  ├── 0000:00:02.0000000000000
>  │   └── ...
>  ├── 0000:00:02.0x
>  │   └── ...
>  ├──  0: 0: 2. 0
>  │   └── ...
>  └── 0:0:2.0
>      └── ...
>
>To avoid such mistakes, check if the name provided exactly matches
>the canonical PCI device address format, which we recreated from
>the parsed BDF data. Also simplify scanf format as it can't really
>catch all formatting errors.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
>v2: keep using %x for function (Lucas)
>---
> drivers/gpu/drm/xe/xe_configfs.c | 9 ++++++++-
> 1 file changed, 8 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>index e9b46a2d0019..f5ce48a0adc8 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -259,12 +259,19 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
> 	unsigned int domain, bus, slot, function;
> 	struct xe_config_device *dev;
> 	struct pci_dev *pdev;
>+	char canonical[16];
> 	int ret;
>
>-	ret = sscanf(name, "%04x:%02x:%02x.%x", &domain, &bus, &slot, &function);
>+	ret = sscanf(name, "%x:%x:%x.%x", &domain, &bus, &slot, &function);
> 	if (ret != 4)
> 		return ERR_PTR(-EINVAL);
>
>+	ret = scnprintf(canonical, sizeof(canonical), "%04x:%02x:%02x.%d", domain, bus,
>+			PCI_SLOT(PCI_DEVFN(slot, function)),
>+			PCI_FUNC(PCI_DEVFN(slot, function)));
>+	if (ret != 12 || strcmp(name, canonical))
>+		return ERR_PTR(-EINVAL);
>+
> 	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
> 	if (!pdev)
> 		return ERR_PTR(-ENODEV);
>-- 
>2.47.1
>
