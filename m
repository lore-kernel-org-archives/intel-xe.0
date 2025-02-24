Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D09C021B5
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 13:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1572910E3C0;
	Mon, 24 Feb 2025 13:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LCU9Yrjd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADE010E051
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 04:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740372103; x=1771908103;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pncEYdSFdlkIQ3Qfz/ansFyUtUwuRfq12yXaFXU2h/0=;
 b=LCU9YrjdYPxq94WXcIvWRF160bUHth5hkRo+UyRgCEf2iVBrWaTdqORn
 zENEkCE3CJtjsNzruRGX6WA0HRr/+GK9+ceKAVn0c3FCULqejeoveOjF9
 RVk9CTM44zjaNB1stYT9mF8w04Nr2DjIsaHSW3puBJKxx7kiyWrM7a344
 5wgFNalR7aWJsojj2awhTSvspruMyWb7YvCKd+NMisRx8zYkav8R/bI0K
 QA7WYFv6KQSQyJg9wnqD11aKM+30UnRmiNwgYli/TfN9gjP+j03TJ4Iy2
 OlRnDtmW+c3ztpC3qjPKQK5kMKpwGw7kUj2D+K8urpsfIP3kjJLwWtT1W w==;
X-CSE-ConnectionGUID: yrrVQkUoQbuQEkNv8dm7sQ==
X-CSE-MsgGUID: aeP1KfyaRi6cK9bCTqAxkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41130390"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="41130390"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 20:41:42 -0800
X-CSE-ConnectionGUID: SzMcDNipSQy7Ah2WMfI0YQ==
X-CSE-MsgGUID: finSewC7RymzBSHVK9Bxsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116861767"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 20:41:43 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 23 Feb 2025 20:41:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 23 Feb 2025 20:41:41 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 23 Feb 2025 20:41:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTq41ZNPAEp2iIKs2DqXLwI+wNXnTTt/XBv6jINjVaFZNFWzE/Vh2xy7U8K7opuPNsaXzVUGl/JYqCKL+GviYlg5qPjftkDjTq1ZmAzYwtyB7hAjG5G5nK5uDOE9d++/nt/uklH0ZnOuLPQjmMbG+2g5JsjeA+s4HSIuMpTlWmGB3n2MgozWDX43dVvkqPD3aruTw+54rTMqtpOXaZzKN6fwmq5kx2/apX79jCilx5PAONeUwBrakDSDPqW4TNsJbkCzIsljhlbINh2psqH9xZ/iuDQzOPxgc14i0HL9HWam7hOmkroEeH4V3BYZfBfg+yJMpGKaIAmiNedBvOy+jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zxt1hkCbMq4j5hqSA/sz/MDv4dm8SVNw+BxVbgiSNJ8=;
 b=hGYqmlwawOC53V9YQN/36G2Y85IU7XSy4NiNbU2jZp8jIKSlocKogjl2jyyH8oPUCWmvafqXQztZ051e8BsQdCKCLwafEixM7QyUZPDVuOarF8YJ4Cf3WiKLzhRDOKH51ihzqmALNi/cr2OCocR/kbhDwBuMPLRip6wynk9I7AxHazaKVqiz03yEYp8jtHf/gGXIDPX/utwMkq0lUba2uszc/ZbWrB/l0+zVGKjgXtdtmX/MMMKQeIgf1d0hKhQxJkEE0zSmaJxsi9lp0cdj9CpfTlpVQCyebp/203naS58fdhS09eWwrBBofyCjyrSr2Thkuj/68Mb3PrvPtlpwnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY8PR11MB7827.namprd11.prod.outlook.com (2603:10b6:930:77::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.19; Mon, 24 Feb 2025 04:40:44 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 04:40:44 +0000
Message-ID: <5d90766f-474d-458b-940a-52d3520dd731@intel.com>
Date: Mon, 24 Feb 2025 10:10:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] drm/xe: Move survivability entirely to xe_pci
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250222001051.3012936-1-lucas.demarchi@intel.com>
 <20250222001051.3012936-9-lucas.demarchi@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250222001051.3012936-9-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY8PR11MB7827:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e3b6d2-b145-4eb2-4fba-08dd548d6650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUwxQWUyZ20zbW1iZXYrdHpkQXA2L2xtVU45bWJIZjF5SFRDUVAyQmhWUmxC?=
 =?utf-8?B?L1VtWUhrczBjbDYwUXYxbEZ0Z0l3eEthZjcwV1BPWTJTbHFMNm1TRmN5RFIx?=
 =?utf-8?B?WDhDeVhvaEZablNVb0NlaDhra1lEd0dNTkhGLy9jR3FWTXNLQmd6RmJ1Z1ho?=
 =?utf-8?B?a0NKR1VaTnZSbWFOdGZ6a09OZFJ6QzhhcE5Ua1VQYmxvTkNvOE1ZZWkxMmFC?=
 =?utf-8?B?L0YrZDJQVHhmRmNpRDZqNytxUXlvYUgvcTJRS25pVWhCbFljRXZqL2dMWGxt?=
 =?utf-8?B?TkNzOWxGd3N5eTd1NWVzVWt4S2VmU2pySTNTVUdhKzYyVThmNGNoclZoSzhD?=
 =?utf-8?B?Z3hDbUdBMnhVdmpQZWhaNU1wMnFqTTZZWVloNEhlenVvVk9kVisyT21FaGlP?=
 =?utf-8?B?cVN0eDBSRmgwS0prNEIvVmVPM2tjMzN3c0p0TWl5dFp0eDVUY3JFYUZiRTRT?=
 =?utf-8?B?bVpNUElQVnJMT0M1Z3VQR255L3ZsOWNwbzkrcEV0L2dxQUczV2pja1prMmJa?=
 =?utf-8?B?anRXSnlDdVJkb3BSeENGS1FSV1pIQkhqK3BYSGwxWE82WGtzVWVZelh5MnBI?=
 =?utf-8?B?VWtudUhES3pNRkpKV0hwczdBcUEzV1BKWmlObDRoWUpWNjBma1dKTTRIRStK?=
 =?utf-8?B?c2dxdnQ2WGY0ek53ditNOUxwTENpaHF2amlYTVQ4WExkRUtLQmdPRnd5TExQ?=
 =?utf-8?B?aEZtVFlVT3VpUDJDR3puUDU1NzdQSVhLKzRvYXdqTFFHVDBESkxKU0x4TkU3?=
 =?utf-8?B?VlNsOG1xNm9oZWpxS2cyK0ZHbHRrVElkTTEyZVIzNDJyWGRRSyszN0tvVVVZ?=
 =?utf-8?B?eDNYTXowRUJMbFdTc0IwYVorVG1RMDYrZVhDcnlWSXg4bUlpaFFlcEZJVXg2?=
 =?utf-8?B?WStFU1VMejg4eUM0TkNlaGIweUpGMTZDWTZZS3lMWEpRZ2EwMHBrbEpFZUhE?=
 =?utf-8?B?US9LRnkwOG5yZ3d0a1JTdG8rNDNNajIwb1hzRTdnVGJFeVFibzRKclFNUjZS?=
 =?utf-8?B?UXliMU5MSkt3VHlqT1R2ZnVsWnZYK2ZiUFFzTlhrdGNyQUNCWHREeml3ejQr?=
 =?utf-8?B?em1rakdzeGQzYnlzKytXdzVXUUZ0WkFhNGxuWEM0Zm9UeTNxb3dPWldqdlBC?=
 =?utf-8?B?WmJQdVBsVkg0bkJRazEwTW5MOWRXWHJteGZxTkJybXgzYmFTRGJ5dXUzalhL?=
 =?utf-8?B?bEM5MTFCWURKc0J5d2xGU3h2cllmOEZLVU9QMXRRUGxvdmJ6WUJHYWhoZURi?=
 =?utf-8?B?VWliRFRDTTVJRzl0YWtlNnhtSXVPUHo1OUZuMWhCREhCMUpSUHh3eEREM01h?=
 =?utf-8?B?MFlJZjM0WnhHSDRIQU1EWWhJTXhYKzdpeXgyOXR1d1o3VTRkcUdDaHlnM3JO?=
 =?utf-8?B?Tm13cGNjaExCSEdGbXdlU2dHSUFGK0ZaSTUzWjVycS8wY21FeFR4ZTB3SGtM?=
 =?utf-8?B?OGVuMVh5enN5Y1pGMWFnTlFqT1RHMUttcDFNZ0RVM1krVkJOTE93MGxXUktL?=
 =?utf-8?B?TkVjMHNlTmRWNXJsUzN2bDVFQXB4NTAzTXdCSW80V1BWeVI0alE3SmxhLzNI?=
 =?utf-8?B?bDJGdER4dStKNExHSzZQRllOaEdnWDU2YWE5L3lyNWovYkhaODBSb3V5dkw1?=
 =?utf-8?B?ckpCdjhCL0lLbWZ3MTRXcmp6SllKa0RSMXNZN1l3dDYvbGJ6S29mNmtVZ1lT?=
 =?utf-8?B?UmdmM0F1bjZHZHdpQzk0VnVpZk9Jazd1d2dLQnl6cWV4aWg1dzEweEZzUjJ0?=
 =?utf-8?B?NE0rc0t6eVZ0dUxvSUpLUHVtSTByM3J3UE04c09nZy9jUEJ0aUJaZHdLa25z?=
 =?utf-8?B?RDJzcG1mT3U5Q2Fkb0dPQ0k5VUZNSGczQzFaRTFuQ2o2SE9Jb2dxUHBwZ1R0?=
 =?utf-8?Q?9fVBZfjXz+TAI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1pmMG15REtTTGc2Y3F5N1F4Z1BmTlBpOGRHVVpoOW15OVREOUdmOEh0UStR?=
 =?utf-8?B?SUJINDBVVWVoWGU2VUEvamNLeUl0anp3bWg0OVBweTNWRGxDTnJwdU9pTVRO?=
 =?utf-8?B?OGhRT3pLN1MvMVZlV3hLbEYxVTBrb0NVSmtuN2g3YzlpOVptN2IweEZGd1FV?=
 =?utf-8?B?Ukk5bEhVcXJxUGNLdnE2cVR1MWFnMjNlZmczaGJTUG9wNE5hc1JmczVWSlRE?=
 =?utf-8?B?K3lyMGx0K2w4QkluaEN3S0tsa0VrU2JCNndnRVFYK094SjR6ZUJQTTVPV05Q?=
 =?utf-8?B?SmlxamFKTHpzOWErVnEwY2lxQ0RVd0hKWW9IdGVxdDhhVEczN1VHV1QzSjlL?=
 =?utf-8?B?UFFIWVpNMFFJTU5jNE1yWlJ5MCs4clpnQnJHTXhCSXhnRWhMUFBhSm93cUxu?=
 =?utf-8?B?VTZicHZldUVyMEJkeDVOUzkxU1llcXU4L2lYNGlqa1VGUDVvMm1IbWYvcHg2?=
 =?utf-8?B?YS9aWUlZMkN1L1ZTcHBzSHdLM0srSHJIRkFhcTJGc0pFRzlYM1hYenFkL1p6?=
 =?utf-8?B?RE9mbjIvNUVrM2pWdHNuNURPQTVGL0gvamFDUUhTY0llejFya2lxc1VZZXpN?=
 =?utf-8?B?THlRUHJrNlFGeXRwRURFWkpBbXA0Q21hTHVxMDR5RnZrR00vYW8wUTNVUHAz?=
 =?utf-8?B?TkhWVUsrOGI1THRndTZueEw3akZnamd6M3o1VnA0YW05NGVLYlJRaDA4UDlX?=
 =?utf-8?B?bkVIOG04amJIZEFvTGxGekhSSUZhMWh5aG8zaDRXa0VBTXZrWlM1bFZqOFUy?=
 =?utf-8?B?YUF5T3RINkVvclZTT2NuaUtUSThJSFl3SGxQekJUQm5ud25EWXVZV2FsSXBk?=
 =?utf-8?B?RWIzYkZhaEh2QTR6bUMzNGlSdDV4WWdaMzAzNU5VRUk1b3F1VTJpWTQ0TEt3?=
 =?utf-8?B?bFErQThtUWZ3VGY2V3VaU05JYUlLR0p3c3YwUHlFR0hZYTJrTlErL0pjZHF5?=
 =?utf-8?B?NjltVngrVXZ6eDM2MWVPS2dpZDRybU1uRytva1BBWEZmYTZlVVdKdEFqY3V6?=
 =?utf-8?B?c1MwZ1RBZVFDZ3A1cjc1MlROZzJETW1VU1JHK213VlJjL2hPVEk0RmVKL2RW?=
 =?utf-8?B?RVlhdUJYS0tmdmVGVTQwcC8yamw1a3laSmFDN3laZDN4WnFld0p5bHg2bXBM?=
 =?utf-8?B?VTNQNndhYWRHcU5vZFZGYVl1bnRtQVJOaGxGbHVad0lQZ0ZNQkZXQWt4enR1?=
 =?utf-8?B?S1hJUW5JTTBxNkpPZWpoeGFEMmQ5Q1hLRlZpd3ZGaWNlTnVwMkxaaE5acU5r?=
 =?utf-8?B?V1Vnem5nMTAzWVJmWDh1ZlpwalA1L2VDbStucVoraVdYaEsxQ0N0RERQSFV0?=
 =?utf-8?B?ZW9wQnNWS2VmaWw5R1czZzRaQk1KeHFnTnh3bzI5ZTNvY21MMnNHamwzY2dX?=
 =?utf-8?B?YUw3YWF1bnc5b1dBS1U0K0luRkpGS0dQUUV5cjJNQ2FBN2gxS0w3NUMzS2lm?=
 =?utf-8?B?NG9ObU1pbit0emdUODhKMERQNlMwN3BNYmlRa1YyYUpNYVVMb3dleGNsa21R?=
 =?utf-8?B?V295eTBMY2tBc05VK0hsUXJ3VFMrM2lLaTBJSUVBNHMvN0ZCSERhUlV4c2ZX?=
 =?utf-8?B?K005MnBkMmN5eVVWTTFtWlYwOHUzNlZZcDVTbWd2dDRMVWFGNS9pNGhtVU15?=
 =?utf-8?B?c1VvZ0VUWE9XbTNGV3daMStma2VWOHhXbTZvR0cxMVFxYzRKYUVTOEh1cTVM?=
 =?utf-8?B?VmU5eGU1T2xURWVFZ1dRd0xqRjBJZHdUM21ZcTJlamw5cm5sK1hLWUN1a3Z2?=
 =?utf-8?B?S2ZVOEd1T0czQWZwRyt0WnZRSVg2aGhPLzdPRi9YZmkvTGxVdU43WUVuSUFD?=
 =?utf-8?B?YzZOZEVpSEN1NFprbGhCZmgrOEZaUmRrL1grdTVpeTB6dkU4MDlQcHpCaW40?=
 =?utf-8?B?cU5DU0R3TC9hcDB3dUFUWFBzVnJ5NElDdldneXVWWkg4RXkxU2d1RnB5cm9I?=
 =?utf-8?B?NUFuUXVFUC9OcFVPQU9WUUtHUjZXSDJjN2diRDZ0em5TVG5qWWZ6aHg2Y2Rx?=
 =?utf-8?B?eHNWRWdPRk95WjRPUjM1UHdBdG44RHdTUHlla3RXYWg1T2pHdmtQQmlQQzQx?=
 =?utf-8?B?a0VKMW45OGNOL29MZlZMK2RrNUNxNUlHWFdJa0N1MXQvSmRtb1NmaytsRTFY?=
 =?utf-8?Q?2d6NA77yu9VQbgZqlh9/HvBHR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e3b6d2-b145-4eb2-4fba-08dd548d6650
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 04:40:44.3703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fm/o4VQEH9q4BLA7pU0yaLlGhoRt5ToUuwArdzrmHISstA1S/05hudnWqIlYiL0cqlTY0oD5b+i22vyUDifEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7827
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



On 2/22/2025 5:40 AM, Lucas De Marchi wrote:
> There's an odd split between xe_pci.c and xe_device.c wrt
> xe_survivability: it's initialized by xe_device, but then finalized by
> xe_pci. Move it entirely to the outer layer, xe_pci, so it controls
> the flow entirely.
> 
> This also allows to stop ignoring some of the errors. E.g.: if there's
> an -ENOMEM, it shouldn't continue as if it survivability had been
> enabled.
> 
> One change worth mentioning is that if "wait for lmem" fails, it will
> also check the pcode status to decide if it should enter or not in
> survivability mode, which it was not doing before. The bit from pcode
> for that decision should remain the same after lmem failed
> initialization, so it should be fine.
> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c             |  7 +--
>   drivers/gpu/drm/xe/xe_heci_gsc.c           |  2 +-
>   drivers/gpu/drm/xe/xe_pci.c                | 17 ++---
>   drivers/gpu/drm/xe/xe_survivability_mode.c | 73 +++++++++++-----------
>   drivers/gpu/drm/xe/xe_survivability_mode.h |  5 +-
>   5 files changed, 49 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 83e64525839db..0f780d6849e2f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -53,7 +53,6 @@
>   #include "xe_pxp.h"
>   #include "xe_query.h"
>   #include "xe_sriov.h"
> -#include "xe_survivability_mode.h"
>   #include "xe_tile.h"
>   #include "xe_ttm_stolen_mgr.h"
>   #include "xe_ttm_sys_mgr.h"
> @@ -695,12 +694,8 @@ int xe_device_probe_early(struct xe_device *xe)
>   	update_device_info(xe);
>   
>   	err = xe_pcode_probe_early(xe);
> -	if (err) {
> -		if (xe_survivability_mode_required(xe))
> -			xe_survivability_mode_init(xe);
> -
> +	if (err)
>   		return err;
> -	}
>   
>   	err = wait_for_lmem_ready(xe);
>   	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
> index 06dc78d3a8123..992ee47abcdb7 100644
> --- a/drivers/gpu/drm/xe/xe_heci_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
> @@ -201,7 +201,7 @@ void xe_heci_gsc_init(struct xe_device *xe)
>   		return;
>   	}
>   
> -	if (!def->use_polling && !xe_survivability_mode_enabled(xe)) {
> +	if (!def->use_polling && !xe_survivability_mode_is_enabled(xe)) {
>   		ret = heci_gsc_irq_setup(xe);
>   		if (ret)
>   			goto fail;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 447eacb355d7c..6b5fa067b39bd 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -775,8 +775,8 @@ static void xe_pci_remove(struct pci_dev *pdev)
>   	if (IS_SRIOV_PF(xe))
>   		xe_pci_sriov_configure(pdev, 0);
>   
> -	if (xe_survivability_mode_enabled(xe))
> -		return xe_survivability_mode_remove(xe);
> +	if (xe_survivability_mode_is_enabled(xe))
> +		return;
>   
>   	xe_device_remove(xe);
>   	xe_pm_runtime_fini(xe);
> @@ -851,13 +851,14 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	err = xe_device_probe_early(xe);
>   
>   	/*
> -	 * In Boot Survivability mode, no drm card is exposed
> -	 * and driver is loaded with bare minimum to allow
> -	 * for firmware to be flashed through mei. Return
> -	 * success if survivability mode is enabled.
> +	 * In Boot Survivability mode, no drm card is exposed and driver is
> +	 * loaded with bare minimum to allow for firmware to be flashed through
> +	 * mei. If early probe fails, check if survivability mode is flagged by
> +	 * HW to be enabled. In that case enable it and return success.
>   	 */
>   	if (err) {
> -		if (xe_survivability_mode_enabled(xe))
> +		if (xe_survivability_mode_required(xe) &&
> +		    xe_survivability_mode_enable(xe))
>   			return 0;
>   
>   		return err;
> @@ -951,7 +952,7 @@ static int xe_pci_suspend(struct device *dev)
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>   	int err;
>   
> -	if (xe_survivability_mode_enabled(xe))
> +	if (xe_survivability_mode_is_enabled(xe))
>   		return -EBUSY;
>   
>   	err = xe_pm_suspend(xe);
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 04a341606a7c5..7ba02e085b5b1 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -127,40 +127,54 @@ static ssize_t survivability_mode_show(struct device *dev,
>   
>   static DEVICE_ATTR_ADMIN_RO(survivability_mode);
>   
> -static void enable_survivability_mode(struct pci_dev *pdev)
> +static void xe_survivability_mode_fini(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct device *dev = &pdev->dev;
> +
> +	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> +	xe_heci_gsc_fini(xe);
> +}
> +
> +static int enable_survivability_mode(struct pci_dev *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>   	struct xe_survivability *survivability = &xe->survivability;
>   	int ret = 0;
>   
> -	/* set survivability mode */
> -	survivability->mode = true;
> -	dev_info(dev, "In Survivability Mode\n");
> -
>   	/* create survivability mode sysfs */
>   	ret = sysfs_create_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>   	if (ret) {
>   		dev_warn(dev, "Failed to create survivability sysfs files\n");
> -		return;
> +		return ret;
>   	}
>   
> +	ret = devm_add_action_or_reset(xe->drm.dev,
> +				       xe_survivability_mode_fini, xe);
> +	if (ret)
> +		return ret;
> +
>   	xe_heci_gsc_init(xe);
>   
>   	xe_vsec_init(xe);
> +
> +	survivability->mode = true;
> +	dev_err(dev, "In Survivability Mode\n");
> +
> +	return 0;
>   }
>   
>   /**
> - * xe_survivability_mode_enabled - check if survivability mode is enabled
> + * xe_survivability_mode_is_enabled - check if survivability mode is enabled
>    * @xe: xe device instance
>    *
>    * Returns true if in survivability mode, false otherwise
>    */
> -bool xe_survivability_mode_enabled(struct xe_device *xe)
> +bool xe_survivability_mode_is_enabled(struct xe_device *xe)
>   {
> -	struct xe_survivability *survivability = &xe->survivability;
> -
> -	return survivability->mode;
> +	return xe->survivability.mode;
>   }
>   
>   /**
> @@ -183,34 +197,19 @@ bool xe_survivability_mode_required(struct xe_device *xe)
>   	data = xe_mmio_read32(mmio, PCODE_SCRATCH(0));
>   	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
>   
> -	return (survivability->boot_status == NON_CRITICAL_FAILURE ||
> -		survivability->boot_status == CRITICAL_FAILURE);
> +	return survivability->boot_status == NON_CRITICAL_FAILURE ||
> +		survivability->boot_status == CRITICAL_FAILURE;
>   }
>   
>   /**
> - * xe_survivability_mode_remove - remove survivability mode
> + * xe_survivability_mode_enable - Initialize and enable the survivability mode
>    * @xe: xe device instance
>    *
> - * clean up sysfs entries of survivability mode
> - */
> -void xe_survivability_mode_remove(struct xe_device *xe)
> -{
> -	struct xe_survivability *survivability = &xe->survivability;
> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	struct device *dev = &pdev->dev;
> -
> -	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> -	xe_heci_gsc_fini(xe);
> -	kfree(survivability->info);
> -}
> -
> -/**
> - * xe_survivability_mode_init - Initialize the survivability mode
> - * @xe: xe device instance
> + * Initialize survivability information and enable survivability mode
>    *
> - * Initializes survivability information and enables survivability mode
> + * Return: 0 for success, negative error code otherwise.
>    */
> -void xe_survivability_mode_init(struct xe_device *xe)
> +int xe_survivability_mode_enable(struct xe_device *xe)
>   {
>   	struct xe_survivability *survivability = &xe->survivability;
>   	struct xe_survivability_info *info;
> @@ -218,9 +217,10 @@ void xe_survivability_mode_init(struct xe_device *xe)
>   
>   	survivability->size = MAX_SCRATCH_MMIO;
>   
> -	info = kcalloc(survivability->size, sizeof(*info), GFP_KERNEL);
> +	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
> +			    GFP_KERNEL);
>   	if (!info)
> -		return;
> +		return -ENOMEM;
>   
>   	survivability->info = info;
>   
> @@ -229,9 +229,8 @@ void xe_survivability_mode_init(struct xe_device *xe)
>   	/* Only log debug information and exit if it is a critical failure */
>   	if (survivability->boot_status == CRITICAL_FAILURE) {
>   		log_survivability_info(pdev);
> -		kfree(survivability->info);
> -		return;
> +		return -ENXIO;
>   	}
>   
> -	enable_survivability_mode(pdev);
> +	return enable_survivability_mode(pdev);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
> index f530507a22c62..f4df5f9025ce8 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.h
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
> @@ -10,9 +10,8 @@
>   
>   struct xe_device;
>   
> -void xe_survivability_mode_init(struct xe_device *xe);
> -void xe_survivability_mode_remove(struct xe_device *xe);
> -bool xe_survivability_mode_enabled(struct xe_device *xe);
> +int xe_survivability_mode_enable(struct xe_device *xe);
> +bool xe_survivability_mode_is_enabled(struct xe_device *xe);
>   bool xe_survivability_mode_required(struct xe_device *xe);
>   
>   #endif /* _XE_SURVIVABILITY_MODE_H_ */

