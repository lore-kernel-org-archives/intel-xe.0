Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0594ECA1013
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 22:50:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28FF10EC48;
	Fri,  5 Sep 2025 22:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bayi6XyV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D3310EC48
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 22:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757112600; x=1788648600;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xGr/13gRb4thI4nRgLJd+2z+vTiZOWZB2vGXMIzMLOo=;
 b=bayi6XyVCppxF4y6OayvjOe1l+D5XlkJEyJADZFuuSWe+bRHx0W6ydX2
 PQ5OTGBCUnn36hGN8noOjRgOx9Y0aPDEZpxIvzbH1vbTZB3fsbVSyrW7i
 Pz9bhnu7WyTu/iWI7y7q8M373M2ndvaMy9wk5XdeMHbnOZTisfgPWPs5c
 g/sT0ucYzQwu/XaD4w5F4y5ehWPWuwVB+2PxwkzZ0TubVJOoQJpmqm3gI
 iAgWm7RfI/4aaKCywsbQgS8mE9hQcPqpn+gnzk4gdrF64XQHjMy8FL7ui
 OnVVXYGBYXaLhLBeaT62ygALjUH3GnAsbXL+jF//UAxnD8DfCzMIFg7Oe g==;
X-CSE-ConnectionGUID: EVG8HtoPQE6CZ+kFIk9i3g==
X-CSE-MsgGUID: cglz1CmtTnaQRfWtZVFEow==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70085511"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="70085511"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 15:50:00 -0700
X-CSE-ConnectionGUID: loVCsVdBQMWbj8LPLcwlLg==
X-CSE-MsgGUID: Iis88/UkRMWjfH/R17Vuew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="172388442"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 15:49:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 15:49:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 5 Sep 2025 15:49:58 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.60)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 15:49:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVL3sdmCGtOUSh0gqObhKvhdPGtjs3rd+SuXShcEzSOSF3rNbmQORNJUsnR6vqS1vHjpynjxsdn8ix3PxjoIXoGKFe6HcX8yIyE4szxhuGC+ZntvzVW/HitpLclRkin0wGL0na8E1EoQWg8h0q1wdhrJzqK0VsabthI+sqbpsET77ZCl6Tnor0+/VUvHMfrWNAyFBO3vnbEUpKyJM6lQhM6AVsROxP7UgT0sc8W1Np76SEOpi+Al4e8iXQvHUfjpZYum2xzD2829zm/ADqWm0AVfYQ+PKqa3fO7IUL2aPTZdI8jpIDruQFo+ehMR5bUKZJ/tpHoy0AUjzLzZWDiSAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BM4vWwrnRxEnUfiP7FWIdOBJyUMDH6mEuCep8sBXwo0=;
 b=MyroUjUN+YucTJFnGeNezm2/RJkYGMePCv4ETU2kM6h5ORD5QpNupuQNZtu8CLch0gP/tI+9T6RJV+2a6pGsHA1CEF9IxssFyciMEfTv2ZY1vvCsl+400dUIgTTqjuuRDScpUpIT6KfkoVlUsuiqVAr2hA9PzuOpVwD3+GXXHl4/XsZL30FS0Y5LOqQHDgE/80NgzGIbpAxQPQ9cq47guhZ4S1tqsLUr77nfY0W1VFj4VxrhfvK7Df+C8SlnMleeUG6ZiX/IaNBLf8lDHktmQpHOzDfzg/Y8wLtypbA/xyJoPZKTWRZY3drreCzz/p56fZyogOY2DVfjo8a16srN6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by MW6PR11MB8437.namprd11.prod.outlook.com (2603:10b6:303:249::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 22:49:56 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.9094.016; Fri, 5 Sep 2025
 22:49:56 +0000
Message-ID: <557c66b1-e1d1-44e0-bf5a-32c0d1d228ee@intel.com>
Date: Fri, 5 Sep 2025 15:49:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: Rename exec_queue ops.fini to ops.destroy
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20250905212248.3312537-4-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250905212248.3312537-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0319.namprd03.prod.outlook.com
 (2603:10b6:303:dd::24) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|MW6PR11MB8437:EE_
X-MS-Office365-Filtering-Correlation-Id: bcae02ca-7d2c-4439-a739-08ddecce88fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z05Idm1xdXQwRklBN2I1ZHBZL2tacTljYkMyTWZtd3NhYWxqSCtTUmg5N3VJ?=
 =?utf-8?B?NW1tWXAyTU9mSUdGZUVZRThwRDdpN0RFWm1Ecmxsb3lpdFZNYlBhYitSeWsx?=
 =?utf-8?B?MG44VzJ0cmtqY3k2cldHSFo1Z3V2cC9RaDhnK3A0NmFPY3prN3B4UmFEVkZQ?=
 =?utf-8?B?Rjh6NUQ3NDYyMDMrU09FcG1nVHdwTlB3RURhQUlIOXMvMnpqeGFrdEY3U0Rr?=
 =?utf-8?B?OVFrQmh5c2xtak1aUm54NitVU1ZZM1FtZ0M4cjBRR0ErS1ZnNFVlTDU1cTh4?=
 =?utf-8?B?aXhWMlBPQkFBWnJFbGExNjRvVWpBU0UyaGE1NnVFdXBCU3BVWWpMRjVLektD?=
 =?utf-8?B?UkhJaXBQcU0yNEM4Z3F3U3hTaCtTL2RLT2F5MDlVTXRqSlZkaURpc1dRWFlN?=
 =?utf-8?B?VFlnNEx4MXNIazNETjR0eWwvYXRtNnBWWFM4d1FWRkpMTmxpL00yOThicW5H?=
 =?utf-8?B?dHIrcWhuTGFaeG5wb0RqK0d5MWFMSDh0MEdsRTM1ZlltZ3pDRzhlSzByTC9F?=
 =?utf-8?B?ekpOdXlVcUNpOTZ5WjQ2a1JQRHhoc2FRQkttVzh6dnJtV201cGYwdG1DMUgw?=
 =?utf-8?B?Mm45RDV3aU5BeHJFSzZmWHZTeHJXL1hYZjladHo4RTJaYVY3ZlFZUHlpQVRs?=
 =?utf-8?B?THVpeXRydHpCYmYwZGI0c2NwMDVOck96aEJVUVlWTytseE1FZW92Y0RwVEc2?=
 =?utf-8?B?Q2NvNkViR0VjOGgyOG5JZmFJN0NqL1VtcjVkRWduMGN4cURyTzZCK0JHMm5X?=
 =?utf-8?B?OHZUNEVXNnFWYUdPZjlQNzYzK2hYc0REczlTdnFybngwY0VtYjIwb0pvaE9n?=
 =?utf-8?B?bHZtL2ljeFZXdVlEQVorUWlhakx3SkRuSFhMdk5iQzg3SlJBdlcxWS82T2Nw?=
 =?utf-8?B?ZkgvZDV6S2RhNTJyc0cyblJSc3N0bUdDdXNxd1cxL3c0QjY1R0V3a2VpOXdS?=
 =?utf-8?B?akpGVFQxRG5TaS9sQ3JHNS9QOWxKa3RXQUlheVZzTXR2MkFLNWxtUHhFQ25V?=
 =?utf-8?B?QzBYK3ZPSjdCQXhzcU4zaVhIWHBHZUs1cE94aVVzb2EyY281M2RMelhLV3Vh?=
 =?utf-8?B?VzVrT1FKTTJqQ3NMQVJma3FnaU5VZ2JxRnFLSVJFVW5IOUdXOFptUFpFUkUx?=
 =?utf-8?B?dytLWjNqU24zbmhieUxzUmFUUXp4NDJWVkxONGlmU3hpQjdOYjhkMDdJRjhD?=
 =?utf-8?B?T1NFMG5EelhnOTJobU02OXBIVlFyQzBVQStiOEpBQjh1Qk1tc1FTOG9JYWxs?=
 =?utf-8?B?d0NDUElqQXRxd0lNOWZzaUJJVnhlMG9CK3VReE13dE12V1VuS3RVb1FiOTJp?=
 =?utf-8?B?eVBRdjdJdFNlT1lPTkVOMlI5Rkw4MVpNYTJCNDR0N3NnRlZEYW5aLzJoM1Q5?=
 =?utf-8?B?U2VQd0I4cWx6SS9zYzFOb1ZGdDFkeDVaMjd2QXd6dEx5eVJuSVhkQ1YwUWFT?=
 =?utf-8?B?MUNodXBWZ21ZWHRNRkQ4ZkVHcWRIVmlDa0ZqK1Q3RXhLMTNpWHdZaXMzZVc3?=
 =?utf-8?B?b1Y5aStZTDFNR2o4VEw0WmpNRWdWQ3JmMW9QdmU0M0FvdXlSdDhyYVo4akVN?=
 =?utf-8?B?d3hIVFhzdm1aMFQwR01GU2RLQmJTNU0vZ3NSOFdwQXRzN25YdjZ1ME1pb2M0?=
 =?utf-8?B?aEFaVGIrNjVQcHNaM0tONzNUS0dWOU9ZRFMvcXNQajByUTVYOTZBRlRqTnFq?=
 =?utf-8?B?VHhlT1JjNHRTNzJldkxuclhBVkR2d0dzcmdvUUh4aXhTTnFLNDdZbWJTeUpK?=
 =?utf-8?B?c0JndkFIeFJFbFZMZmR4cjZFekFPYmNmTElBUkdGTndIUWJ5UHVOWXlYLy9Y?=
 =?utf-8?B?R3FPbnlvcHNzMTU0OFM5TzhEUElzcFlwVFl6QTk2UjBubkJQNm03Q3lwWmVI?=
 =?utf-8?B?dlZzUUkweGxhaUxIOGdPVGJtdTkzSDNJWmhyZkxlZW9jNFJXbkpkbUNMMnFD?=
 =?utf-8?Q?VTHTJ4K2LfU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1ViTS91VEtKWURYMVVCOENpZmpNQTFiZlZWNkliTU8wTFlJRG1oUmR1ZkdK?=
 =?utf-8?B?Sldjc1hHWE9sWE85eXNoNkMvQXZCeXJ0MVBVQlEraVRnOEttZVN0Q2NWSlow?=
 =?utf-8?B?VWxBd1NXU1ZRbkNsYXJLZGVnZUwvblI0V2J0dDE0bi93YUNiMHVYYkd0U0Rs?=
 =?utf-8?B?cGNMRzVtd0tXd1YyeXF3eGFyWjFhU1RWT0liaHZ1L1dra0J6M2psRk9FbDdk?=
 =?utf-8?B?MEFWZi9HODZvTU5WamIyUVpacW9PT0c0aVcrT0htbWdDYTRzUzd6TVF2VGNQ?=
 =?utf-8?B?emVvbEVsdkIvK090ZnppaFhGRFNCaVIrVnROVzhJRkxFMFdmTXgrZk5wNTFv?=
 =?utf-8?B?eVBGZnJFdVBzV0VpVE1MWVpSeTlDMUZMNEpnTzZDYmdQcEZaOHpoblpMcUVu?=
 =?utf-8?B?UmswSVNiRHo2VHlPOXM5L2dkL3dvWGw2TVladFlsS2EvWERUNUhoTjk5TG1n?=
 =?utf-8?B?YitvRDRKYkdpU3Q0R3JwZFZlSDFpYWJZeXJXd3NxUVg0b3BYQ0VYYzRUOE04?=
 =?utf-8?B?ejZPUjN0ZHVGV0lUdXowY2RYSnh3ajFaNllGZkptdUg3UUVYQ1F3TTNHZTRQ?=
 =?utf-8?B?aWpqdThkNUtqUzNZV1VnL1RYRU5vdHI3NVduSmsyUStDQThzcVVjRnNuSjcx?=
 =?utf-8?B?OUpuNWVVQzBpcDZWK2VBSHJFbHhzMUpyKzhCSjJtMVU1N2FiUEx2Zm9sMXdo?=
 =?utf-8?B?Tk0yYlNVRUtVRitZNVpoLzk2QWJXbmh2LzZqS0dENVAxekZlY3hocEhhM3lY?=
 =?utf-8?B?ZW1nNUFuelB0bjB0QWo2YW5kcGxLVlpJT3VmWXpFNWxCT2oxSjVqSHdsd2JD?=
 =?utf-8?B?dXVHcWN3b0ZheG1vTnIzVUl0WTZiYTArMDByUG1IV0lMWTVDUVNMb01EOUM4?=
 =?utf-8?B?d0dCZDFsTjFGRVlDT0lyaFl4UlBVeTBYdXVOVURxRXk3YXB6WnhGTTlyanVD?=
 =?utf-8?B?OUxiTUpEWUt1aTllejBweGNRckpQbWN5MEkzcHN3cnhkbGR5Qmswb3hoVy9B?=
 =?utf-8?B?WE9ydW04ZHZkcnZLTWFSR3ROUjRCTjJxSUoxYUxrTDNHWDNnOWVwR3p4Vktj?=
 =?utf-8?B?dmdyMVVEZnRFSDcveEhNQXdpSUpSTzZHWDRvb1JCVUxUNHlTZFdhd0FQR3M5?=
 =?utf-8?B?MG5OQ2dkcjlBdEsrUlh3ckdyeDc4MUFVaTVSVzUyTGRGMUh1bkVCd0FKbWor?=
 =?utf-8?B?dEpqNVFjQVE1bTVyQ0hZK0ZzSzh0UWl0SjE3am9MTU5tK1NGalRCYzRzVnhU?=
 =?utf-8?B?M3RaTHNSd3NHa0t4a1dPd1c2aisrMDEyMlAvNzg5K1F3eDhXdCtHMmYxQk5l?=
 =?utf-8?B?aDJEVGU1aGpML1dmYmZCclFVWTNMd2JoVkNNVXllTGZnbXMrN2I2UUEvMWRw?=
 =?utf-8?B?bzhtTjVzVkkvRGVTNmx6RmxEMkxnQ2VIc21DR2tiT3Q2VktsdkRXdGJsYkxI?=
 =?utf-8?B?Z3FmWXQrYnFEV1lIRjlXUnlOSWphSVRPYnprRklwSlVwRzVIVkxoTFVPTzJn?=
 =?utf-8?B?UlpQQjFJRklWYUp3VE12UloyeFNCdkM2azZQdkZyRmhTSDFiMUUzS0IxdnIr?=
 =?utf-8?B?VzhZQVE5L0llNUxIN1NCL3hyYnBWRnE0M0xFYVNrbUUzQXpNVHZzR3VPcnJY?=
 =?utf-8?B?YUNMTUtyUmVlTVpvQVZvdWZLS0ZZNVFkOXhKdUZOVlQ0emprR2RYZ01HUmNh?=
 =?utf-8?B?SU1xU3I1SktuTDYxRkVRWlNZRjNSdEFGK0IvK1Q4UTNzSEpEdmFORDRweWJv?=
 =?utf-8?B?dzBpcU5CazBzb3JYLzFGQ1l6WVd5dGo5MjFyTUNpRzJuZ3ZtaGFFc3dxdm1v?=
 =?utf-8?B?ZHNBWXp4ZUxvbFNIdFlHR3JVSHl6WTFQTGtPNGY3ckVhdS94cVkzU0kzcyth?=
 =?utf-8?B?Y0JhdjhVc2lCOHV5Z282aDc3S2NuWFhpaDU0NWlnL2NDOHRSaVFoM1RvL0NZ?=
 =?utf-8?B?YWlVWWpyRGdUTmQ4QVZOTk96M0ZzNFpNcWdJeTJzM0o1MTZrYWR2TDlpOXYy?=
 =?utf-8?B?dFo0bDc5Tm9RU3NnQ09tU295WDVNbkFFYzdFRzdRNjFPVXltL3A2UU5PL0VZ?=
 =?utf-8?B?V01heDBsN2dySlRvZTdwd3hCTkZodktYRjd6aGF2UXc5Kzg1L1pnSjhsY1Rz?=
 =?utf-8?B?bnZJcUE1b1dxV3d2OWNzWlVVTzFMNWFQWUlPOVJDcmY5aW5KaEhXMHU4OVp2?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcae02ca-7d2c-4439-a739-08ddecce88fe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 22:49:56.3833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8mYBLYD4oeEKqN4in6gddK647DqE43xMVOO88eVSoD6Bwm7dPGkVNch/2p7TgDUcXxLDlsl0P2A/lWp4iqqipnlg/BVNEwuTSa6bOLboz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8437
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

On 9/5/2025 2:22 PM, Daniele Ceraolo Spurio wrote:
> The existing .fini backend function does not just cleanup what was done
> by the .init, and it instead performs extra queue destruction operations.
> Since we do require a function that just undoes the .init to fix a bug
> (fix coming in the next patch), it is cleaner to use the .fini name for
> that new function, which means we need to rename the existing one to
> something different. Since the function pointer is currently called from
> exec_queue_destroy, the .destroy name has been chosen.
>
> Note that this patch is meant to be squashed with the next one before
> merge, so that the fix can be applied as a single commit and
> backported more easily. It is being kept separate for ease of review.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c           |  2 +-
>   drivers/gpu/drm/xe/xe_exec_queue_types.h     |  4 +--
>   drivers/gpu/drm/xe/xe_execlist.c             | 12 ++++-----
>   drivers/gpu/drm/xe/xe_execlist_types.h       |  2 +-
>   drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  4 +--
>   drivers/gpu/drm/xe/xe_guc_submit.c           | 28 ++++++++++----------
>   6 files changed, 26 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 063c89d981e5..b6c63845dbab 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -331,7 +331,7 @@ void xe_exec_queue_destroy(struct kref *ref)
>   			xe_exec_queue_put(eq);
>   	}
>   
> -	q->ops->fini(q);
> +	q->ops->destroy(q);
>   }
>   
>   void xe_exec_queue_fini(struct xe_exec_queue *q)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index ba443a497b38..d1dfd3eb19e2 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -181,8 +181,8 @@ struct xe_exec_queue_ops {
>   	int (*init)(struct xe_exec_queue *q);
>   	/** @kill: Kill inflight submissions for backend */
>   	void (*kill)(struct xe_exec_queue *q);
> -	/** @fini: Fini exec queue for submission backend */
> -	void (*fini)(struct xe_exec_queue *q);
> +	/** @destroy: Destroy exec queue for submission backend */
> +	void (*destroy)(struct xe_exec_queue *q);
>   	/** @set_priority: Set priority for exec queue */
>   	int (*set_priority)(struct xe_exec_queue *q,
>   			    enum xe_exec_queue_priority priority);
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 788f56b066b6..9115e2b13b8d 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -385,10 +385,10 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
>   	return err;
>   }
>   
> -static void execlist_exec_queue_fini_async(struct work_struct *w)
> +static void execlist_exec_queue_destroy_async(struct work_struct *w)
>   {
>   	struct xe_execlist_exec_queue *ee =
> -		container_of(w, struct xe_execlist_exec_queue, fini_async);
> +		container_of(w, struct xe_execlist_exec_queue, destroy_async);
>   	struct xe_exec_queue *q = ee->q;
>   	struct xe_execlist_exec_queue *exl = q->execlist;
>   	struct xe_device *xe = gt_to_xe(q->gt);
> @@ -413,10 +413,10 @@ static void execlist_exec_queue_kill(struct xe_exec_queue *q)
>   	/* NIY */
>   }
>   
> -static void execlist_exec_queue_fini(struct xe_exec_queue *q)
> +static void execlist_exec_queue_destroy(struct xe_exec_queue *q)
>   {
> -	INIT_WORK(&q->execlist->fini_async, execlist_exec_queue_fini_async);
> -	queue_work(system_unbound_wq, &q->execlist->fini_async);
> +	INIT_WORK(&q->execlist->destroy_async, execlist_exec_queue_destroy_async);
> +	queue_work(system_unbound_wq, &q->execlist->destroy_async);
>   }
>   
>   static int execlist_exec_queue_set_priority(struct xe_exec_queue *q,
> @@ -466,7 +466,7 @@ static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
>   static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
>   	.init = execlist_exec_queue_init,
>   	.kill = execlist_exec_queue_kill,
> -	.fini = execlist_exec_queue_fini,
> +	.destroy = execlist_exec_queue_destroy,
>   	.set_priority = execlist_exec_queue_set_priority,
>   	.set_timeslice = execlist_exec_queue_set_timeslice,
>   	.set_preempt_timeout = execlist_exec_queue_set_preempt_timeout,
> diff --git a/drivers/gpu/drm/xe/xe_execlist_types.h b/drivers/gpu/drm/xe/xe_execlist_types.h
> index 415140936f11..92c4ba52db0c 100644
> --- a/drivers/gpu/drm/xe/xe_execlist_types.h
> +++ b/drivers/gpu/drm/xe/xe_execlist_types.h
> @@ -42,7 +42,7 @@ struct xe_execlist_exec_queue {
>   
>   	bool has_run;
>   
> -	struct work_struct fini_async;
> +	struct work_struct destroy_async;
>   
>   	enum xe_exec_queue_priority active_priority;
>   	struct list_head active_link;
> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> index a3f421e2adc0..c30c0e3ccbbb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> @@ -35,8 +35,8 @@ struct xe_guc_exec_queue {
>   	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
>   	/** @lr_tdr: long running TDR worker */
>   	struct work_struct lr_tdr;
> -	/** @fini_async: do final fini async from this worker */
> -	struct work_struct fini_async;
> +	/** @destroy_async: do final destroy async from this worker */
> +	struct work_struct destroy_async;
>   	/** @resume_time: time of last resume */
>   	u64 resume_time;
>   	/** @state: GuC specific state for this xe_exec_queue */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 860c07da598a..faed952bac81 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1418,10 +1418,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	return DRM_GPU_SCHED_STAT_NO_HANG;
>   }
>   
> -static void __guc_exec_queue_fini_async(struct work_struct *w)
> +static void __guc_exec_queue_destroy_async(struct work_struct *w)
>   {
>   	struct xe_guc_exec_queue *ge =
> -		container_of(w, struct xe_guc_exec_queue, fini_async);
> +		container_of(w, struct xe_guc_exec_queue, destroy_async);
>   	struct xe_exec_queue *q = ge->q;
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   
> @@ -1445,21 +1445,21 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
>   	xe_pm_runtime_put(guc_to_xe(guc));
>   }
>   
> -static void guc_exec_queue_fini_async(struct xe_exec_queue *q)
> +static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
>   {
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   	struct xe_device *xe = guc_to_xe(guc);
>   
> -	INIT_WORK(&q->guc->fini_async, __guc_exec_queue_fini_async);
> +	INIT_WORK(&q->guc->destroy_async, __guc_exec_queue_destroy_async);
>   
>   	/* We must block on kernel engines so slabs are empty on driver unload */
>   	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
> -		__guc_exec_queue_fini_async(&q->guc->fini_async);
> +		__guc_exec_queue_destroy_async(&q->guc->destroy_async);
>   	else
> -		queue_work(xe->destroy_wq, &q->guc->fini_async);
> +		queue_work(xe->destroy_wq, &q->guc->destroy_async);
>   }
>   
> -static void __guc_exec_queue_fini(struct xe_guc *guc, struct xe_exec_queue *q)
> +static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q)
>   {
>   	/*
>   	 * Might be done from within the GPU scheduler, need to do async as we
> @@ -1468,7 +1468,7 @@ static void __guc_exec_queue_fini(struct xe_guc *guc, struct xe_exec_queue *q)
>   	 * this we and don't really care when everything is fini'd, just that it
>   	 * is.
>   	 */
> -	guc_exec_queue_fini_async(q);
> +	guc_exec_queue_destroy_async(q);
>   }
>   
>   static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
> @@ -1482,7 +1482,7 @@ static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
>   	if (exec_queue_registered(q))
>   		disable_scheduling_deregister(guc, q);
>   	else
> -		__guc_exec_queue_fini(guc, q);
> +		__guc_exec_queue_destroy(guc, q);
>   }
>   
>   static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q)
> @@ -1715,14 +1715,14 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
>   #define STATIC_MSG_CLEANUP	0
>   #define STATIC_MSG_SUSPEND	1
>   #define STATIC_MSG_RESUME	2
> -static void guc_exec_queue_fini(struct xe_exec_queue *q)
> +static void guc_exec_queue_destroy(struct xe_exec_queue *q)
>   {
>   	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
>   
>   	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q))
>   		guc_exec_queue_add_msg(q, msg, CLEANUP);
>   	else
> -		__guc_exec_queue_fini(exec_queue_to_guc(q), q);
> +		__guc_exec_queue_destroy(exec_queue_to_guc(q), q);
>   }
>   
>   static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
> @@ -1851,7 +1851,7 @@ static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
>   static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>   	.init = guc_exec_queue_init,
>   	.kill = guc_exec_queue_kill,
> -	.fini = guc_exec_queue_fini,
> +	.destroy = guc_exec_queue_destroy,
>   	.set_priority = guc_exec_queue_set_priority,
>   	.set_timeslice = guc_exec_queue_set_timeslice,
>   	.set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
> @@ -1873,7 +1873,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>   		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>   			xe_exec_queue_put(q);
>   		else if (exec_queue_destroyed(q))
> -			__guc_exec_queue_fini(guc, q);
> +			__guc_exec_queue_destroy(guc, q);
>   	}
>   	if (q->guc->suspend_pending) {
>   		set_exec_queue_suspended(q);
> @@ -2202,7 +2202,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
>   	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>   		xe_exec_queue_put(q);
>   	else
> -		__guc_exec_queue_fini(guc, q);
> +		__guc_exec_queue_destroy(guc, q);
>   }
>   
>   int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)

