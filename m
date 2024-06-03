Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5F5C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 14:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98AD10E0A0;
	Mon,  3 Jun 2024 14:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hJ6z9pPT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2023A10E0A0
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 14:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717424204; x=1748960204;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=atftbW6FXSnwxsjJbMUcbcqSHERqz4kGvqDmAq2G1Ww=;
 b=hJ6z9pPTw8B1RaAPm/h1XkqWenF9LRn3+RcC4eGCs2xsAcqKQY3YT7tY
 AvCj2N9+xNfv+Pkhak+azCsEPq0xOUpFh5okozQoE2ASof3B/DbQZcPW5
 OXNSd80+A0og+vAvpFmNNAowWbM25JITr9l4PFthe7NCFONctnPUhCYRf
 ivUFA6XCve5fQ1txEVs/UFD/yvohhKRb4PuvgsXJIdyEJMUVPrdKh2p77
 NwfFVttubvlzB98tUFAP9nswXlW9uEjZ8NjyYqmbnRBIE1A/t5tariejp
 DveoAOSHu/KHv7yUlLIkSsG2Wuhf+JEwXBr8k9xINzJv/Abgw/wJuh18m A==;
X-CSE-ConnectionGUID: ERqMp097SAW+a2YYu0jYNA==
X-CSE-MsgGUID: yTGbcRb3SfKqb3EF4I1iAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="16860644"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="16860644"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 07:16:43 -0700
X-CSE-ConnectionGUID: tfyP1769SZWkAx2ZgCxxdA==
X-CSE-MsgGUID: 9gviNXImQmqMffB/Z3nKUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="41431628"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 07:16:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 07:16:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 07:16:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 07:16:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 07:16:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9B2zVOAuvupvBITclQk6Dfq+GSXUOZYhzVbN61QzREifS4nOaN6JU0SHmfSQkqR6FkLiLd6GDYq+tCW1pysFmG6+bCqzNyEOGgLkky45l6CAfFtyUhJJ0k0i+Y0iLch70sBHffZ/UJylQLE1Rt510u1O6WhMAIG75ODrabHY9T5kBzHsEabeVdQUyTQv1jGPPOxaHCBIhNYTClYDduAAOmphxjr4Mb9u7fChaTXXD4MVn5qlV6Jrf+2ALeQwNHHEAZsDcVm1yk/3PQooJIb5vG97KxUt4x4FFsrKiB+BHCn/dxMJjoxEaSSL9z4wNfn4IdzZwkF4AElvsgB2R9cjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgIeRJW++giH6yRBO2aZjii/B7+3mTbrlzPFsQ8cYcA=;
 b=L7H2nJLFpUh8NLrt/4lpzVGtIcLO+XZmGKYVPl7Ju1YYAltDY3gLVEnfIazmJv+lNX/D6VKD0KEUST9v9UVr+4jnPIP4r62gl/v8u/e99OgJMhQp3Ex1kmu9Em+nnbRF7ARpukUXeHxvmhq6LY6urbQu1fpyML6JYvx25GdgBD9xRMqDlWxPDf3BsZHidDIABLIajTEYh8h0J4DvbHYDORFGVuPZuMcynSLo/bo2wwFM3qDPF8Qc6M39cwIjlCVJVW+mPcJRsWdEorJjMOgZXznaCDEJ7YhiuTeTkPBvShguIZkVyCzdX1dtdgPtKCZpjm658E5ptKoLwvwfhSCfsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS0PR11MB8717.namprd11.prod.outlook.com (2603:10b6:8:1ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Mon, 3 Jun
 2024 14:16:39 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7611.016; Mon, 3 Jun 2024
 14:16:39 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240530151313.2284182-5-radhakrishna.sripada@intel.com>
References: <20240530151313.2284182-1-radhakrishna.sripada@intel.com>
 <20240530151313.2284182-5-radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v3 4/6] drm/xe/trace: Print device_id in xe_trace_guc
 events
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <lucas.demarchi@intel.com>, Radhakrishna Sripada
 <radhakrishna.sripada@intel.com>, Ville =?utf-8?b?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Mon, 3 Jun 2024 11:16:33 -0300
Message-ID: <171742419350.5170.17833987307199164077@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR03CA0268.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::33) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS0PR11MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: ed48ec4b-79f6-4a1b-e8d3-08dc83d7c8a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODZKMGVIOGszbFNrM2pJWEFadEpwNjBZVHVRUm40Snd6aExqZ3pFdDM2RVJy?=
 =?utf-8?B?aTZEbnVNcWtZeXRON2wvWk0wbkFjMEFZQVYwNGZLTTdFU1Y5d3JjOUdSNEda?=
 =?utf-8?B?bGR2NE9od3A3K0cwUkxHU2ZoVWNLSzROSkdzOHBsRkc1bU13THV5cVFEMDNl?=
 =?utf-8?B?LzVWR2t4SlJtdzRyRVF6UTg4ZzJGQ0w5alpoNXZVUEpnZTF4VDlkZE9IeVYv?=
 =?utf-8?B?ZUsybm5UcHBVRHJhVGt4WWliM2tPcUluMXRiNjBMVnlSMVZWOUdMMERNYk5k?=
 =?utf-8?B?eXAzU20wU0M0KzdkNEZYc2JQMXVMY0wxOFo2eHFXM1JrSnBqMmJ4dWdxQjd3?=
 =?utf-8?B?K1JQcEdmN1ZudVNRU3gyM3R1UzFUWG0waDQvK21KdUVsN25YSW5ScG5EaHl3?=
 =?utf-8?B?NWFaeFptVW1QQWhYazlldTQra2ZSZkZkcFM5VnZ6M2FVOFZHVEpuM0ZJeGR2?=
 =?utf-8?B?ZWxXaGFVSnFXU0puQ0srNWFTUlBOT2I3WjJqUjJ6a2pycExxQTdOWG5FbUcz?=
 =?utf-8?B?Mnp1N3ZYM0NTMmwvVWhyOVNRTmZxS25BM1Y1MVdrZ0o5bmwxQTNGR0l4OEJ0?=
 =?utf-8?B?SnZ0QVNrVWFtakgyNTE5MXdUZjgycmtLMDdwckFpdHZudzNXWTZWL2Q0Uzhl?=
 =?utf-8?B?d1NRcEdwSHluRHBSZTNGYVVwVGZZcHRiaWlwbXN1ZzBqT0oxK25hcURmNFJ1?=
 =?utf-8?B?TnFHQWs5TUtlTnNMUDJDOGhyN3dwclR1aVpkME9xNlZXVHdjTHk5MXRxQ2lC?=
 =?utf-8?B?WVFLaFk5eFFWc2xBU2Y2bndSOVdpb3gxdWFxTTN2eTJXU1JZTmRaeG9EcWdJ?=
 =?utf-8?B?MFBLbnluWVUyd0N6Qm95dFRORmJOZGNyQVJkYkFQN0hPV3grS3FBamkzaUZQ?=
 =?utf-8?B?cDNYOXlIcnhUR3RydHhBcHQzYkduWXhMQ05MS2tHc2JPRldYOVJOSjRDbjlI?=
 =?utf-8?B?azYzbEZyb2ZKUGJLL2l0RXRudVg1eEdHd2lxLzZjRGNNZzI1R3daZ3FBUWV6?=
 =?utf-8?B?SlRGNHBkdlFPdFl6UnZzWmVQbU84LzdSREdTOURydkVwMG9UOEJFOGd3M2Fr?=
 =?utf-8?B?VHJ2QkJVK2tzZ2p0anNUVFRsUW5pUDRCQ0R4ZDlMUUR3K05ZM3UwYzB4VkJi?=
 =?utf-8?B?djRBVXpZbEtZMDgwRFBXVzhRTkdmWTFyQ1ZYUFAvcldrdUJINXhGcWczUzlE?=
 =?utf-8?B?NkRNZVZUZDJXaXRJVk1ocWpPd2plS1hQOWNmNmF1YmlMZUN2RXRsLzZJZjNB?=
 =?utf-8?B?b05lYkhwOWZHY2lhbE5rRVJzbVR1ODh4ZUZXSW5LK1gvVlkrMHRpRzFRY0E2?=
 =?utf-8?B?WnlOS000SWdQWVEwdGxTQVZuTWRVbjIxYmdxUGRCU1NqbHNjWFU1aE5qOGV1?=
 =?utf-8?B?Q0hBMFJRcUw3RkhIdGVXWHV0bG51WGVvUXRreEVMK3VzSTkzbmUxbHlTMldP?=
 =?utf-8?B?cVh0OVpYNktVaVk1azZwdHc2QzRMT3RSTHZid0hyM2YreU5UMW00Q2VRa3Zn?=
 =?utf-8?B?M01VdGNTVGFFR20yM2lCM1ZveFlBMllDcDJNMzA5SWVwNmVtRGRZa1BadExP?=
 =?utf-8?B?R0tpclRmdFRFMzMwOUxaUk43V0phZzlRU01yUWRhQlplcVd6K015bXVoRHE4?=
 =?utf-8?B?ZWVFNUNrRzZEb0I3bWtWUHV6S0pTTFovanRIcGNwQ1ZaQU5renp3TnMrbFZW?=
 =?utf-8?B?QW9xTjlBbENnZTlNSytXQ2FxcWZPRXE4OTVtMm9pVmloWTdjTGtWd0d3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmZDMkppeWZRUDhEZFRkMDdkMXNPT1llOWJIN3NLV0dlT2NZVXlyWURuWFgv?=
 =?utf-8?B?dzFOR2d0QXhrUG9SSlNERTlHcG1OV0V6VFVIZW1tdExWSmJCOUJ3Nit5OE13?=
 =?utf-8?B?YWJGd0JRNTFRZUhUZG43RFA4N0l5Kzcram1tOERGWE9EU2drSkE3ODlObzNT?=
 =?utf-8?B?dWU5UUoyNGwzTnlFNWs4TFgwVUM2VkJrMzdJazM0WDVFMlpCZjhkRkJOcUNw?=
 =?utf-8?B?QmRFSHkrNDVzZW5Jdm4zRXAvakFycTFFSk9qU0RWSWE0MVdka3dVWUplWHpl?=
 =?utf-8?B?WVgwWTNuWGtSbmhZRUM3RXArV2xKYTBYLzZiajNWaC9MRCtqSTNEeFp2cmtO?=
 =?utf-8?B?azF0WUtOaTRGVWVtU1FYcGZMZzVYNE45WjdGTjBpc1JEUjFZQ1VyYUJBQ2l6?=
 =?utf-8?B?QXVUMTh2N2hHR2Foa1VMckRMNWxkZHVEWjBITXF2Zk1KNjVEb2I2dmNmdXNZ?=
 =?utf-8?B?elFQd3VUOFZKRmJMaHR2UnJlLzZmRkU5bjR4dlZHTHRNWnZwSTNhUE4rdFNl?=
 =?utf-8?B?OGVhU3NHZmsyWXJReVJ5RG9pZGEzWWZWNjV3UEp1NG1NSVNUNWM3TWRzRVBz?=
 =?utf-8?B?NHZYOWtvdnRsZHduTUJZL1AxVTB6dUg5QnVlQTBMMTRqOEFlak5OSGNLckxi?=
 =?utf-8?B?S1I0eG1mczRITGkweGhsTDNRemZBbHNkOS9Eay9kNkpEMEtuNFBXRXVzM3ZP?=
 =?utf-8?B?amN4d0RFUXZmVmdGcjRkaXgzaWxlLzROYlhQTVBxa3pCKzVxaHdsbzNJQkdQ?=
 =?utf-8?B?dGNSYzhSM3ZjNGJSckhtK3VySHBtckdnTVQvdHQ5Q0RxT1RLVll2TjI1akpD?=
 =?utf-8?B?R3dCUEZUaGpXeXVUb24zdnJHWlNmMkJ1a2dieGNDQjZtandxREIyK0lobmZM?=
 =?utf-8?B?bnNlaG1EYk5lRFBqRDdIK1ZoNVliMnVSUVd6c3A0MnBjYnpnbUNUdWhKN2c5?=
 =?utf-8?B?clVYNGR0d3hxU0NvR0lhOWFVRGZGZy82VWtQbGM4dDFvaG5JVlpUNWl3N3VP?=
 =?utf-8?B?TDdybjRHNFQxTjlhU2lUZjUxYS9hbEw2K1NxVGw0SWJFNmJrMElKYzBpOHlQ?=
 =?utf-8?B?SmFEMTlvdnp1UFBRWTlDaHBRREFpMzQ3YUhVZXNqb0RpQzFyVVdtQ1l6QW5a?=
 =?utf-8?B?SGhBS0JWb284aWdua3luNkZDS2FUclRnWkdON3NlVkl4TklKM3JOenI3MCt0?=
 =?utf-8?B?QzdUY2lGblVENi9FdzdHK0oyOUJEYytpVGRCUjVXN2pxVG1mK3QwUmcybXl6?=
 =?utf-8?B?YzZ6bGg5T0RGSkVHa0JqRU85L3ZSZHFwaXRiclpZWk9TR2szY1BYT1VKQ1I5?=
 =?utf-8?B?MWd0Y3ZNbmI4eWRvTjhsNVp1WENnZEVmcmVYbmJaUzJnTVZtSDdaY1ZHSG1K?=
 =?utf-8?B?Nk4vQkdpc0piaFBmY3p4NkE3ZXN5cWJsS2dsU1BSMnNVYnlmcWFFU3loYTJP?=
 =?utf-8?B?QjNNMFZuT1RXNmV3RE9JbFRxU3FEU0RGVW83R2t2S01ZZlpibjg3bDZYQ3BM?=
 =?utf-8?B?YytwU04yaDVIaDdBUFFPcThMdExmVjE1NzhqeXh0NXRFeSs3QUxrSFJUNWdr?=
 =?utf-8?B?emEzTWdjVWFNeDRPT0k5TWFWRSt6bC9MbC8vZ2JTeDlXckt2M2JHellPcFF5?=
 =?utf-8?B?UVdTUCtPVTdZQ0FlZ0EzZjhQWk5sekRnaklmMFZxclJZZ0lHNE9lc3RMeDds?=
 =?utf-8?B?MndISUQrMW8vRDJhRVhJUXhWQWdTa2dXOThXMm5pckM5NmFXdk9LZkx1UjZZ?=
 =?utf-8?B?c2hrbk92M0xGdzBnTVJ6Q2VQeDgyaHZMWEp6YlJ0cGk0eGhCckt0YXhxTSth?=
 =?utf-8?B?YlNCb2V4UDRSR3pEbkhBdjVIdVN6eU5EeUU1UTI5REJYYWJBMjRaN084Zlla?=
 =?utf-8?B?V05rMXFaMFZaNWF2RmVIUjdZNjVtbUIrVmpLRkFxWldLeWw5R1hCSks1WDcv?=
 =?utf-8?B?dkl6REtXenU3OG9NWjVvTkp5K2FJQkdwZkFoMk9JckhvRVZVejYxSzNNd3ZN?=
 =?utf-8?B?Q1Y2MndRRTc0UmpLY3JTUlVmQUYxd1hZQldLbWlTNVVscEo5aDNpY29UdXBi?=
 =?utf-8?B?d3FYU3RwMzI3dDQvbjlMWDlkUEl6eUdIR291QldReEpLM0hSTFQ5Q25YYXc0?=
 =?utf-8?B?Z3ZoYWd1WWliRzU3TnZ0dVdhS2JCeVJQTG5JZVlubTZWOVd3M0VIZTlXeVpp?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed48ec4b-79f6-4a1b-e8d3-08dc83d7c8a8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 14:16:39.0567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7nPloxPwppqLmPZwxWDoENP3vpB9fAwdVz/I6L6AtlQjYXG/FiUkfkXfNBjO+pjvjtVXmFrqD2rzlBhECu80w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8717
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

Quoting Radhakrishna Sripada (2024-05-30 12:13:11-03:00)
>In multi-gpu environments it is important to know the device
>guc txn belongs to. The tracing information includes the device_id
>to indicate the device the event is associated with.
>
>Suggested-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_ct.c    | 13 +++++----
> drivers/gpu/drm/xe/xe_trace_guc.h | 44 +++++++++++++++++--------------
> 2 files changed, 32 insertions(+), 25 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct=
.c
>index 78f79df638d5..5b08cceb994a 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>@@ -528,7 +528,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *=
action, u32 len,
>         /* Update descriptor */
>         desc_write(xe, h2g, tail, h2g->info.tail);
>=20
>-        trace_xe_guc_ctb_h2g(gt->info.id, *(action - 1), full_len,
>+        trace_xe_guc_ctb_h2g(dev_name(xe->drm.dev), gt->info.id, *(action=
 - 1), full_len,
>                              desc_read(xe, h2g, head), h2g->info.tail);
>=20
>         return 0;
>@@ -641,6 +641,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, co=
nst u32 *action, u32 len,
>                               u32 g2h_len, u32 num_g2h,
>                               struct g2h_fence *g2h_fence)
> {
>+        struct xe_device *xe =3D ct_to_xe(ct);
>         struct xe_gt *gt =3D ct_to_gt(ct);
>         struct drm_printer p =3D xe_gt_info_printer(gt);
>         unsigned int sleep_period_ms =3D 1;
>@@ -668,7 +669,8 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, co=
nst u32 *action, u32 len,
>                 if (sleep_period_ms =3D=3D 1024)
>                         goto broken;
>=20
>-                trace_xe_guc_ct_h2g_flow_control(h2g->info.head, h2g->inf=
o.tail,
>+                trace_xe_guc_ct_h2g_flow_control(dev_name(xe->drm.dev),
>+                                                 h2g->info.head, h2g->inf=
o.tail,
>                                                  h2g->info.size,
>                                                  h2g->info.space,
>                                                  len + GUC_CTB_HDR_LEN);
>@@ -680,7 +682,8 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, co=
nst u32 *action, u32 len,
>                 struct xe_device *xe =3D ct_to_xe(ct);
>                 struct guc_ctb *g2h =3D &ct->ctbs.g2h;
>=20
>-                trace_xe_guc_ct_g2h_flow_control(g2h->info.head,
>+                trace_xe_guc_ct_g2h_flow_control(dev_name(xe->drm.dev),
>+                                                 g2h->info.head,
>                                                  desc_read(xe, g2h, tail)=
,
>                                                  g2h->info.size,
>                                                  g2h->info.space,
>@@ -1170,8 +1173,8 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, =
bool fast_path)
>         g2h->info.head =3D (head + avail) % g2h->info.size;
>         desc_write(xe, g2h, head, g2h->info.head);
>=20
>-        trace_xe_guc_ctb_g2h(ct_to_gt(ct)->info.id, action, len,
>-                             g2h->info.head, tail);
>+        trace_xe_guc_ctb_g2h(dev_name(xe->drm.dev), ct_to_gt(ct)->info.id=
,
>+                             action, len, g2h->info.head, tail);
>=20
>         return len;
> }
>diff --git a/drivers/gpu/drm/xe/xe_trace_guc.h b/drivers/gpu/drm/xe/xe_tra=
ce_guc.h
>index fb4976499812..8a7953803696 100644
>--- a/drivers/gpu/drm/xe/xe_trace_guc.h
>+++ b/drivers/gpu/drm/xe/xe_trace_guc.h
>@@ -15,10 +15,11 @@
> #include "xe_guc_exec_queue_types.h"
>=20
> DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
>-                    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u=
32 len),
>-                    TP_ARGS(_head, _tail, size, space, len),
>+                    TP_PROTO(const char *devid, u32 _head, u32 _tail, u32=
 size, u32 space, u32 len),
>+                    TP_ARGS(devid, _head, _tail, size, space, len),
>=20
>                     TP_STRUCT__entry(
>+                             __array(char, devid, 12)
>                              __field(u32, _head)
>                              __field(u32, _tail)
>                              __field(u32, size)
>@@ -27,6 +28,7 @@ DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
>                              ),
>=20
>                     TP_fast_assign(
>+                           memcpy(__entry->devid, devid, 12);

The same question from the previous patch applies here regarding using
variable length copy vs using a fixed sized buffer.

Also, any reason for the choice of memcpy() here against strscpy(),
which was used in the previous patch?

>                            __entry->_head =3D _head;
>                            __entry->_tail =3D _tail;
>                            __entry->size =3D size;
>@@ -34,30 +36,31 @@ DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
>                            __entry->len =3D len;
>                            ),
>=20
>-                    TP_printk("h2g flow control: head=3D%u, tail=3D%u, si=
ze=3D%u, space=3D%u, len=3D%u",
>-                              __entry->_head, __entry->_tail, __entry->si=
ze,
>+                    TP_printk("dev: %s: h2g flow control: head=3D%u, tail=
=3D%u, size=3D%u, space=3D%u, len=3D%u",

Similarly to the previous patch, maybe use "h2g flow control: dev=3D%s, "?

--
Gustavo Sousa

>+                              __entry->devid, __entry->_head, __entry->_t=
ail, __entry->size,
>                               __entry->space, __entry->len)
> );
>=20
> DEFINE_EVENT(xe_guc_ct_flow_control, xe_guc_ct_h2g_flow_control,
>-             TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len)=
,
>-             TP_ARGS(_head, _tail, size, space, len)
>+             TP_PROTO(const char *devid, u32 _head, u32 _tail, u32 size, =
u32 space, u32 len),
>+             TP_ARGS(devid, _head, _tail, size, space, len)
> );
>=20
> DEFINE_EVENT_PRINT(xe_guc_ct_flow_control, xe_guc_ct_g2h_flow_control,
>-                   TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u3=
2 len),
>-                   TP_ARGS(_head, _tail, size, space, len),
>+                   TP_PROTO(const char *devid, u32 _head, u32 _tail, u32 =
size, u32 space, u32 len),
>+                   TP_ARGS(devid, _head, _tail, size, space, len),
>=20
>-                   TP_printk("g2h flow control: head=3D%u, tail=3D%u, siz=
e=3D%u, space=3D%u, len=3D%u",
>-                             __entry->_head, __entry->_tail, __entry->siz=
e,
>+                   TP_printk("dev: %s: g2h flow control: head=3D%u, tail=
=3D%u, size=3D%u, space=3D%u, len=3D%u",
>+                             __entry->devid, __entry->_head, __entry->_ta=
il, __entry->size,
>                              __entry->space, __entry->len)
> );
>=20
> DECLARE_EVENT_CLASS(xe_guc_ctb,
>-                    TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u3=
2 tail),
>-                    TP_ARGS(gt_id, action, len, _head, tail),
>+                    TP_PROTO(const char *devid, u8 gt_id, u32 action, u32=
 len, u32 _head, u32 tail),
>+                    TP_ARGS(devid, gt_id, action, len, _head, tail),
>=20
>                     TP_STRUCT__entry(
>+                                __array(char, devid, 12)
>                                 __field(u8, gt_id)
>                                 __field(u32, action)
>                                 __field(u32, len)
>@@ -66,6 +69,7 @@ DECLARE_EVENT_CLASS(xe_guc_ctb,
>                     ),
>=20
>                     TP_fast_assign(
>+                            memcpy(__entry->devid, devid, 12);
>                             __entry->gt_id =3D gt_id;
>                             __entry->action =3D action;
>                             __entry->len =3D len;
>@@ -73,22 +77,22 @@ DECLARE_EVENT_CLASS(xe_guc_ctb,
>                             __entry->_head =3D _head;
>                     ),
>=20
>-                    TP_printk("gt%d: H2G CTB: action=3D0x%x, len=3D%d, ta=
il=3D%d, head=3D%d\n",
>-                              __entry->gt_id, __entry->action, __entry->l=
en,
>+                    TP_printk("dev: %s: gt%d: H2G CTB: action=3D0x%x, len=
=3D%d, tail=3D%d, head=3D%d\n",
>+                              __entry->devid, __entry->gt_id, __entry->ac=
tion, __entry->len,
>                               __entry->tail, __entry->_head)
> );
>=20
> DEFINE_EVENT(xe_guc_ctb, xe_guc_ctb_h2g,
>-             TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail)=
,
>-             TP_ARGS(gt_id, action, len, _head, tail)
>+             TP_PROTO(const char *devid, u8 gt_id, u32 action, u32 len, u=
32 _head, u32 tail),
>+             TP_ARGS(devid, gt_id, action, len, _head, tail)
> );
>=20
> DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
>-                   TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32=
 tail),
>-                   TP_ARGS(gt_id, action, len, _head, tail),
>+                   TP_PROTO(const char *devid, u8 gt_id, u32 action, u32 =
len, u32 _head, u32 tail),
>+                   TP_ARGS(devid, gt_id, action, len, _head, tail),
>=20
>-                   TP_printk("gt%d: G2H CTB: action=3D0x%x, len=3D%d, tai=
l=3D%d, head=3D%d\n",
>-                             __entry->gt_id, __entry->action, __entry->le=
n,
>+                   TP_printk("dev: %s: gt%d: G2H CTB: action=3D0x%x, len=
=3D%d, tail=3D%d, head=3D%d\n",
>+                             __entry->devid, __entry->gt_id, __entry->act=
ion, __entry->len,
>                              __entry->tail, __entry->_head)
>=20
> );
>--=20
>2.34.1
>
