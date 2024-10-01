Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472AFCEB2CD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 01:26:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE89910E04A;
	Tue,  1 Oct 2024 01:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JpTTR5R7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7660110E04A
 for <Intel-Xe@lists.freedesktop.org>; Tue,  1 Oct 2024 01:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727745982; x=1759281982;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OB6rQIftn+ii9OpwnY8lVon7OEGSxim8rHzzPx/gvbs=;
 b=JpTTR5R7+h4b8eSvSz5dP0tjU1jg9z0BvQdfuSXcEUCFPiM1L+ziCHwp
 21bIYsKDsPvNCkUfCmZwcHiTODj1bOaEmuegXUbvYDRk/S9fQ3eQ5NI8E
 BWw/LGLfxdI4YsdCFsSvYNYWL0ikGX5tHMeuspyoJRPn5z4paOP4dmebT
 rSzbLWU38YRoEiqnEa2Sh0aK5UcBqfhFL41h/i+V97vXiEoIky4ptXLdo
 VcpC3e7Enk9M3J3/vU7vkkhrIL8QgFvO03o4cu+xiqUf+xx0NBRmfNlYg
 fTv3DEyab5eS6AnuQYT6WfExYYZ+tZnkuHYY4s1phZ7jiTx0nyPrnVjYA w==;
X-CSE-ConnectionGUID: tCQZ3FHBRv+uDjCs4TdIDw==
X-CSE-MsgGUID: GhmBl+9kRBGwCMl/7cqUUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="14483119"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="14483119"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 18:26:21 -0700
X-CSE-ConnectionGUID: FRQORA9sQAO8Q0zBBBjFZg==
X-CSE-MsgGUID: lbbKaduARaKLvk8mnSiOtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="73449805"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 18:26:21 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 18:26:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 18:26:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 18:26:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 18:26:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 18:26:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=goLgg0kq5F3RlrwTV0M7Au+QiViR/IZJ/L/eUs37js45LsSlj24BQb4xBNuVIsi0M1kLBU1nNyYfs07pZM9OEZLyUKEKrbNPEzRmM5sAc/ijqOJH7TdfFohRl/DeziiSpvdi9F9llGzo8FXQBVgx5VsPIc+CedACVpcHYZ0F9x6xULermy8owC2RGEy5QoQGGlvZQDRaCbDum9oOaONBgKSafVj8SRpreM25G8sHUEdl1Iftgm3mXOK9cjUjsqCxahsgB1fCMjV65whBf2ulXPOcq/XpE1YFzOhiZa0XDB5vV4tyltrVNHRz3aAQ/WYrTwZuMpXd9o/cQUn4w7efYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OB6rQIftn+ii9OpwnY8lVon7OEGSxim8rHzzPx/gvbs=;
 b=fSkiMEiKYtMKpW1hnWlJB17my2haNs5Bkk1hqep2+iLcG85ywntuZd8kv2GvQ7Bhl5HQVIHycbSQUKb4A8sKy57z/Q6qQwX7ppAWsza/AUU2H3ERM7Yc3Xj2Qg6rlxRgDdxLXcVL0yo9dyPzhU4SY0RApq+t2H/ZoKGfqIsysZSoAutGlniDJ8HEilvwkuC+YjPd/BfIZTxW/LtUmLkOTWVClhNwRt3SK1GvbEXSWy8N0crblC0wdL+3jCN/wjnpOOfreYYQ3K2e/XakKufKDnwHhcmOZtvNE9QCSnsJyxNoIupCiHP9hdAqJD8EeVbddVXNZ7mHkdK/S/OQo9/NAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by PH7PR11MB6545.namprd11.prod.outlook.com (2603:10b6:510:213::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 01:26:18 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%5]) with mapi id 15.20.8005.020; Tue, 1 Oct 2024
 01:26:17 +0000
Message-ID: <3640fa10-0e85-4b71-a05f-c93e07f244df@intel.com>
Date: Mon, 30 Sep 2024 18:26:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/11] drm/xe/devcoredump: Improve section headings and
 add tile info
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240920032108.629796-1-John.C.Harrison@Intel.com>
 <20240920032108.629796-4-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20240920032108.629796-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0230.namprd04.prod.outlook.com
 (2603:10b6:303:87::25) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|PH7PR11MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 61ba7610-c1f3-4e92-6e34-08dce1b80c15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGYxcFZmOHowbmtMOTZoOXVPN2h4MEgwVFF1VkEyMU5qYW9TRFFYNWZhVGxv?=
 =?utf-8?B?UFBqRkwwVzV2MWtKb1R5akNCRkROcmdvd2hWb3BqQ1JwNjR1eThIUWtJYndE?=
 =?utf-8?B?NSsvbndzcVlhR09SdGdnemtEdkNmcndyY1Q5QndNRW9iM1pxL2dmVllaZnpr?=
 =?utf-8?B?UkRtSnhUNytscGNTWVF1Y09rVzVLb05EbjJHNkk2YXJQRGovalBnT1BySDNo?=
 =?utf-8?B?N25BWmhFUDkreHAxNW5VK2NaWUpGRUk4SGVOcWpUa1NHdkhkMHFPMlErWEw4?=
 =?utf-8?B?bVBzYWRDcUZNdk1rcjExajYyWHhJcUV5aXA0MVgxNXhMbFNlSUN0R0d0aEdU?=
 =?utf-8?B?NjdHcE11Vmk1Tktad21XdDIzOFdVWTBwQ0dtUlY4bWhuRE1icEt1OHVrMis1?=
 =?utf-8?B?RisrOEhEYnNYK0NsYzZ6NWo4RXhyaGhRblBNQ1gzYkk2K2czVGtXZ1JrNXls?=
 =?utf-8?B?cUlaeUxXM0lPWW1ycmV6OFZUT2pUQWVkeml1azlKMWVHVFNUY3VoRFR1TE8r?=
 =?utf-8?B?U0VXQUpkWk5STXl5QlNadE5SV1U1OEhXUDBCUWpJY0lBZzJIdWh2NHlxZEVu?=
 =?utf-8?B?MnZWMVJ6dy84RjFhV21wSkpORnBYS3BueEVWZGpBMkZTUTJUMk5ZZ2lsTjhs?=
 =?utf-8?B?a0ppUUZreGNFM2w4aU9rQmovRmdsbHdaRXJQOVNiOVRiMHZnTzh4TEZwZ2NZ?=
 =?utf-8?B?VHNQckJEcmdNQlQwemQ5WVJuUVdPb283Q2NyajhXWHd3Q1pKeFZ1a0J3ZUFX?=
 =?utf-8?B?cVRlQXdYQ1lMb2poaExiTHM5SHVpY0ZiYVN3dG84bWNUL2w5SVJMWGNOMCtG?=
 =?utf-8?B?WTBwUjB4clIwM2VhU3FVZDFXUWpxZTdsendVWHl1V2FzT2pBNEd2UmlDaStW?=
 =?utf-8?B?Q0UzeEdKalMybWNNSkRCeEZFR2QzS0Z1VUViWkY5OTI4WE5zU1FkSzJhZDE0?=
 =?utf-8?B?Y0R2VkJtQzk5VVdmU2NWbmYrTFRuQUhvNnlIVzBETkh1a3hqZ2F0c09UOHNo?=
 =?utf-8?B?Um1SWHR3azRhWkFaVmd2OUtNU3ZrOGtxemx0RjNsZ2diNWMxT2l1ZGQ2TWlZ?=
 =?utf-8?B?V1VmamtlcXY0T2NxZVE1OCtkaWtESnNrdlNpeGRLV1YzcmM3ZW5uTDdsTHdY?=
 =?utf-8?B?NVU3U0Q5blhkZzhvZ01HTUNOc2dmUUlxYmpSR0VMS2Z3dWFPWVB5UFlwOXgy?=
 =?utf-8?B?MkREN3JaWlJNMTFablRUUnl4WXRGc1E5YTRTNG50VTk3bk9BcUZsbGsySUZK?=
 =?utf-8?B?elJMdVJ6MjU0MHZEOGMzWG5ZY0UrMXN0STFLZmNTSkRReTBYQWRxdFQ0Tk05?=
 =?utf-8?B?Wk4rSEpFNUdCeWJOVEN5QWxaN0RjS05mZjhYYzI5azhqSzFDSnZvMm9TaG5C?=
 =?utf-8?B?SXlTUlZpSTdxbEZ4Unk0dlFLaEl2RVUyQkl3dkd0MEZMby9DRmdINUtrSnZn?=
 =?utf-8?B?dXlzMHVZbWxkM1FOWDM4STd4dHN4MnNoZEhoaXYvbkpLRFFKMzRBNXhXMzVX?=
 =?utf-8?B?TDlTd3U1Q08yTXVkQTZHaWo1aTRFWkZXTndlcXZISWJKanRWcWhsT0Q3WWxr?=
 =?utf-8?B?V2FFNUhUaGRwL0FURlVWcW9WaWxYWm5PaDZ0ekt4aHhUcmRoVjRHZzRXZW9W?=
 =?utf-8?B?T2FpeUlpd3JkSXFyQmptV1BKTGptS2dzckNVVzRna3lZSnRETnJCM3dGOFkw?=
 =?utf-8?B?TC92T0lyMWlRVXRDdW1nRTN2UjFPdFBQL3BxU2ZpZzZRc2owNHJtL01nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3ZvMGIxMUo0WmE0SDRHK2Y3MmUweWNRSE5ScFY4MGJvWjFkMVV5WXhSUHQ1?=
 =?utf-8?B?cllRcVg3d0dVSHQwTkdRcGc5WnFjV014RDM2WWJUSXVlSXNGQ2x6RTBBbGVP?=
 =?utf-8?B?b0E5VktFVERIWHlTamhNb3F1a0hqaXcrSFROVWFZRlFYa3gxMGRBMFVaZ3hk?=
 =?utf-8?B?RGwrUEdiRys4V1plTGpEczczcjBMQlJwdUlmcHR2RXhuYm1RdURmZG9Zc2FF?=
 =?utf-8?B?RUh0WXJyaUZrekhvRmpXczNlZysxd1FRKzVxc2hmZlA0N0gySFhpNk5zUFJU?=
 =?utf-8?B?aTFlYXpKeW5QWlkvNFpadk9qMVRoMm9STFF0REgzSW9rMHlPTm1GK2xzVGs4?=
 =?utf-8?B?d042cWtqb2VwU29tM3ZzOTljY2pqVk9jRHJ3bFNyd0Y1RWNRZDdFM0d1alU1?=
 =?utf-8?B?ZDNwcnZ5WDlFS2RZMGJuQlp5MUxUUExJamNxelh4ZU80ZW04VXdJL3Mybys5?=
 =?utf-8?B?YStEZ0o1aWdoMGxDZk1ha2tyM09QOE01MlhYUHBXbXdvYjYzRTF5aXJNNm9J?=
 =?utf-8?B?MFVwajAxY3pIV3JyREhPTVJ4eXpzUXYvK0dFdXFnWE1sNDhHVld2bXhsVm0z?=
 =?utf-8?B?b25vU1A4eGZpVHM0QTZRSVRONUtoZEMwaDhpWnNQdDk3UUdlYWhMTVcwS0M4?=
 =?utf-8?B?RmlNMmhVaFA3N1daTnlnUGUyTWhGY0hrd0JwVFJISi9YUXBkSXp5ektoaG9l?=
 =?utf-8?B?NytXV2lNcHhlWnpTZHB6OFY5ZjcxeGF5SzNSd203eWQ0dDFJVE00YkZSODhO?=
 =?utf-8?B?VU8yZCtFM3VnWnRQNkk3UEdpZ3pNS200YnJmR2RHMk1BTDVBUlZhV1RzYVhk?=
 =?utf-8?B?UFZhZEJSSDRmai9Kc2VUMUtpRGRXcnB1MmFMNVVUMEpPZmJqRXFDUUZKTzVW?=
 =?utf-8?B?UnV4b2Y2cm1sekRGTlB2K0lTVDIzWlNtd29JUEU3OFVmZXhjQ3RLMGlONUV4?=
 =?utf-8?B?YXBkWi83NlNKZGRHd2FoTCtpdjkrSXg1c2t3dnVaWlZnSENKdXN0NkdHaDc0?=
 =?utf-8?B?RjRKcEFmaUEwS1RZaHVITGRUT2VJcm4rVmMxamx6WndFTTM1aElwOWNaYzAv?=
 =?utf-8?B?YkwyWkVlMGV4b3pEYUZBa0JTck5GaUNqeVgwNHJtK0xJZzFPbEtKNmNZbDQz?=
 =?utf-8?B?QndaRXJjUzJwb2czQ3FsS2FEdUFlTFpsVHphUHhIemxORUQwNDVTMXRIalUr?=
 =?utf-8?B?N1Y3QTY3NUhVczRLSlVhaDdnOTF2Nmt6L2hsd0c3T3ZqS0tibUpPenFyRTh4?=
 =?utf-8?B?d05DYnR0ekVVZFFENkRaWmhHWGozZjc0MjVwd1V2ajVHQzVicUlGUDBoUVJG?=
 =?utf-8?B?d1NiaTk5cU1hQ05hVyttKzNWMTlQbEFJRUNNYVN4anIrVlhmeDV3Um9YbWI5?=
 =?utf-8?B?NjdzMGlTWW5tMmczdkVsWDNlZUpsQTcxUXhQakVMRDF5eHdtdVgxdGRnZFVH?=
 =?utf-8?B?YzNTaW5IK0prMHJ5L1ZMd2dUUG1NdGlJYVdQZEFHTVFkUWtsaDg4Y0YwRDBv?=
 =?utf-8?B?S0FyNW4xVnNCREVxNzJpM2FDZ1NlTmQxNFRGZzlWcTlKN0h3dE55c01qS3Fu?=
 =?utf-8?B?NnYveTZ1Mlcvclo0ckhkdDlKMEkzSi9nZXZZU2w3SjR2alFjS0pxYzVQcWJo?=
 =?utf-8?B?WE9vTC9TN2EwdlJ5UWIrSGd4WjFaWENSWVoxMVlwd2J1RC8wM2F3aVNibXNu?=
 =?utf-8?B?QmJ0QjlVOWl1UVlFc0FUbE05ZmhTRGJnRXBXdjQ2M3dOdFYzYXNjMTEzRTU1?=
 =?utf-8?B?V2xia0ZGNTJyOGlSNU05NGVZZWh2UlJ2ZnFuKzByckdJYWZ6S1RPSC91ejhp?=
 =?utf-8?B?ZWZjTmJxc2VKaDdUZkc0MWQ5WUJUZUF2WDR0Uk5LWm9nMEtYTGdteXRXL0V3?=
 =?utf-8?B?NndSWWl1d2VNTjdHWDhHUTVCclZQUHhuU0RYclgvZXh4YzZXUkFsOTU3UHcw?=
 =?utf-8?B?M25ndUhpYkl2a2poVkV2Y2dQR0ZxYWZMaUFUcy9KQjczN1RjN1h0QzhKY3Zk?=
 =?utf-8?B?NGtjVUZvMEVPcDNDbk1zOWtveGFvT2w5b3FkRUNkK3dkVkVHak9sSUM2SWdy?=
 =?utf-8?B?TWc1N3FoT0tiTlpEVFV3czJaQjNob2NwV0wrenB2cnR1N0VUKzZ5aFZqelVJ?=
 =?utf-8?B?cytvSEFTbFptSXQyYVpoTm1vWGRkTzZLRzVLZFNhdU9BT2VzRHMxdUV0czJF?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ba7610-c1f3-4e92-6e34-08dce1b80c15
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 01:26:17.4734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +U3TDEHEDsISlXoFN9n9eXpCMdmnJMdzf1WpkDiAyLNSU2hHAp164SodCWm4EW/5Gf/5ATS+vs8SJmQSkuk7JjpI0UeaTqPhApncMSbauO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6545
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

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
