Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E6EC5DF81
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 11:04:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A7F10E11E;
	Mon, 24 Aug 2026 11:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kIl7yey3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFC210E11E
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 11:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787569478; x=1819105478;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QOuxUhE63E4itcT8MxN+w7+ANc+YONjUGl50PwPXJ2I=;
 b=kIl7yey3CxAu342GMw+mV5n9DUk2QsgALd0EIdcsEVe3GYyvqSfr4FeN
 sOUBNR5IvvFm/IByVDsXo6dBoY18HQZaXDEuPHPJvinReCSgo68h3v21G
 xNrrgLsu8e+t3kHtBXLwLOf2VOVlEnzcd9ed1o09RYLW6+ToRgNuM+puH
 LvPLJ7GJ6+/GpJKbIsbF+NA2vbcTpHQ8D0mXYFpvemqdfZS1TmEVyr6Zz
 ykh/XSjtrn4h8aDbiLkwABn2moYMg6Urti67rwi36/+kholPFeHJfScTd
 SJKZ+up/Lj44DNiMJu+6ZrpEqJzGnQwNUWZhFBnUecDRhTthbIVD9dLv2 Q==;
X-CSE-ConnectionGUID: Hq7pLDXRRq6jQ02DeXreZg==
X-CSE-MsgGUID: 2ww33nEeTYyL+rgatBahfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88220534"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="88220534"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 04:04:38 -0700
X-CSE-ConnectionGUID: +qsW+vfhRUmjI+PzBTlr0Q==
X-CSE-MsgGUID: /Se5vhxBTKuuUFOIi88I+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="260824531"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 04:04:37 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 04:04:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 04:04:36 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.18) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 04:04:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DpeshK6DHUQ5t4U+Y1RfrATRLdw7URVj6GzjLk6h/3GSeWTfhwS6COU1cwDverXLPx6fon5dyfVMP4AhEENxzXdC6VyVAD2hnOuzAPPOQQlQ3JHYpNER5TnW+C+6Di2t96aXTT+SlBztsHtDS69GjVus3j9ez8Or3Fl47Z7NKPwj6cZXU0/GG93ay8W0xo5wF86f3mfDTGV+3ST3eSG2iu0/Mm0v6Dr16TneBdgxVZLFsUp5oAdv+133PXwdPIYYK0gDRN0EcQO6sUdG1RGrQawYepnGWA53Z79QmFjA/wkCsEMogW/wyDpgOv0Gg5h+QFJsd6oIrHro2SKjysbeTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QioObXSy9WpTlmHQtMBk1O+Vwg2NGc3WefJOxXuZJco=;
 b=ZnuV9pGXnsrjglBHtU7Y9VAuel4F5rvvN65XtMSHRwpuc0+pv9Tu6anwYq/25mILrq3ksjsbN270emZB98EgGswYo4PEnaoVLvvDNJxUuZ4rHfgr9ts6IBbYORz8i1VV45IMB2m/BAFcCkbAuWp8IGDX3a75GgyyTnEMKaEeFidhaas2DNrNTdn1VpnXE7bu8KkrqGB3G8O3+o4kRNh6/BRkbpmbsscSaNQWsgeRxSJVbMTTdU1d09tjHtJw77cy11qZw1sRVICwca9IhkPELeR7QLF5bf0z5vZPpJ7p0cS0HfKRRm7euLk8MdLPmoWbzJvN+2N4dxxNc46s2jR/Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CYXPR11MB8711.namprd11.prod.outlook.com (2603:10b6:930:d7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 11:04:34 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 11:04:34 +0000
Message-ID: <3ae4858b-0bbb-4052-9c73-726643cf7266@intel.com>
Date: Mon, 24 Aug 2026 13:04:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_clear()
To: "Tauro, Riana" <riana.tauro@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <karthik.poosa@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <anoop.c.vijay@intel.com>
References: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
 <20260820101632.527214-10-mallesh.koujalagi@intel.com>
 <9894fca5-809b-4952-9edf-01b3d448d9df@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <9894fca5-809b-4952-9edf-01b3d448d9df@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIVP296CA0041.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:356::6) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CYXPR11MB8711:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f0ad0c7-f3cf-4a12-be5c-08df01cf7ab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 27ygniTrDSqkhAHV7OXXFUscOLtL/sTkC7QOfViY6u6UobyRNON+0XY8R32ufNOM/5an5cXF9S35IbCQR5q0WMnFRSPnQt12p9SwOAIPweSXMpi3ywVzYz7ZDfqVwzCwGams1oE/ccSWSkXOOwmcMw4EEpLMrxMPap4jOvvq+p/G63V1YvkTgLHvK1kBZjZzJq5WzDbMLsNxOhQB+pZ6/T1m79Pj/BKYPZ0ybp8UHTqbqoal09SjveISSKHoMiQ0KwJkKFErvjjE1Mp6KRVMAn5m0V+wvjEqA38LIA/rglmdOjjXGeQcoJKEjCmT456ipBkbMRNXIeUjD6VAoTGJ/Hr9kc2gI43gXk7GN16CaMEv4QXpZuYkaMkgpjH0AZZe+I2bSnXgnwGywgV5mCRLGhX32S5xxonFs5+QgAsc9L6n0rUAZekyCoG8zeAKio/sw19BRTVdB7TcdNldHriWhiP+wStEX1y/xK86NP9x5FoZovfuqrqj/puGYxCMXRA44z++xGk0GCswc8l+sHgXfojOYsBwCyCaNN83rvZ9oDvdTUljfqxF9fh6hpyJ7VBKGY6qxLxTQioQ00fBPvvVY9wKr1/+UFgcbJ8+h9+2AuRmC0kKsY690ofwCVCA3K8+6JJsO1fsDPQUsx6RMNpfpw+4zYpdN3G2x/eM2wsjsNo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWFwSEw0TWF4S2FDTmx1Ui9mdmJtSWpnMDdvNjc1WVVnNTk2eFJDMXYyQ1Vy?=
 =?utf-8?B?MnFNeEV2N1p0NWJCNVp1L1JiWEdTQ0U0NHNyd3M4V3FlYnBnWDF1S2VRRHFm?=
 =?utf-8?B?TnBzdkZVZ2xBejB4ZXRRSDdaNmlacnJJNUtMUGx2YTdqK0NxK1piNGRPUU5C?=
 =?utf-8?B?eHdtNCtYUnRLRnZ1STUveWw2M0doMWdLVXZKZE41aS9LcDFvV28va0d2WmND?=
 =?utf-8?B?OWFPbUNtK0tJdG5TeGV1N2hqSDEzR0hiY3pBclpGN2Iwbnc5VEcrdGZKREly?=
 =?utf-8?B?V0FHb1JOTFBXYnVRM1lxTnhFVmo5U2NwdGZsQ0VwVHRtWHk4ZWVxK3BGTDdQ?=
 =?utf-8?B?WnJma1pwQVhkaVRVS3dDV3J0SEVpcWpaTnMrc1FtelhLV3VJemdpWndVVFh0?=
 =?utf-8?B?OW1CVitjcGZWUlpqR1MzQjRtMVZhQ1kvM0I4OUlVcW9lenFNLzk3bnBpeS81?=
 =?utf-8?B?MFJxTU9tZWR3SzBiU2hxd0UvRExmRllmMGVrSyt0Y2h2bXdwNnV5M0Z3Zmto?=
 =?utf-8?B?NEpDT2RTVmNaQUdSQ2dwa1JUTUQ1UW5LaWtQTUk4TUhuVkxBR2lYQXhlZVBk?=
 =?utf-8?B?c0dIVjZFL0xzbmVlaURvSGtydHhyeU9OVHlUSkgzNmsyY2NGeHBvOGVEVHJ6?=
 =?utf-8?B?N0swMDJCUkkrdDdqdms2SkZKZEFwa0V1OTkvTUxCUGpPVk42OUdMTDZ1ZWxj?=
 =?utf-8?B?K2VCNXZoSjNqb0hIdzBRWUJ1VUNoNW16ODlzMHJ4QVNQaUtlMTlQQXRkSjd0?=
 =?utf-8?B?NlZQcEFKTTQwbktuR0VlRDQvUzl0MGNJdkh1WVpCd3ptQURpcFhDQmFXaDk4?=
 =?utf-8?B?NHhDOW5LTTVaNVB3YTl1OWZ1QzBON012SklkNW1zQWM2L3NUZVNjRzk3WFEy?=
 =?utf-8?B?Q0cwVWd6SElNcENkaFYxaTBySDUyVGdFVGp1bW43TXhYd1A2Ti80dmtGV2tX?=
 =?utf-8?B?elcwTFkwN0kvU1A1ZjVZMDVxeDVodVNOaXN3aUxOVFBDVndBNnFPQWhLSnZh?=
 =?utf-8?B?TGd6c25tZ3J3ZXZhL3ZYdHRBYnRIdytQVXl1MzhnUDFRN0tKNUFmQyt4Z1FT?=
 =?utf-8?B?NzE3Wkl6QmR0RVVwWmltd2xhSzlkdzdEZUxpeEFRblpoRXp4am95eXRrV2FJ?=
 =?utf-8?B?eEZONEhOL21tbS9heUppaEVDMmdtQW9HU0d6MkdvWHdUUGl1VzBtaG9ZUG1S?=
 =?utf-8?B?cEhWVWt5VXpuSkliN3l4Sk4zYWg2dUJCdHZoQUM0UUVKRm5ubnk5am5nWW1C?=
 =?utf-8?B?NTRmWHlqWjlmM3JkTHFwL0N5NmpxRC9PcGJ6QTZBZ0FqL2tFdkZ6UDRGYVJI?=
 =?utf-8?B?NGprTXNaMys5akVvZGRtYXZTSHh0V2wxclV3YkNHYTg5bUdIRHE0SEJzRzdp?=
 =?utf-8?B?TlNhRWNlSFpwMlk3akF0SHM2QjQ1MUUvc2RaMjJvRi96cWFtc3FPbDI5UUZw?=
 =?utf-8?B?eEJWTVRxV0R1ek1kZjM4bFo1TEt1ai9xdTAwcVlTVXFsRXZORnovQnFXRkJ1?=
 =?utf-8?B?ZERBMENZMFVrcW5lcE8wdWFpTVhvVHJreXlzU1pOZGwvcjRuRlNEdFF3Q0Fq?=
 =?utf-8?B?Q05ESHlReG1VTVpyMzRKUExJaTVwbHk2eWw4d0kyS1hRbmlFaXF0OWdZL2oy?=
 =?utf-8?B?cEo0RjUvQ3dlQlYwcnNNK1IxQUd3emxEbFJsSzY1OWdKYzAyTW04MlF1WUpG?=
 =?utf-8?B?R2htM2IvVmdzcFFhUm84aEJocEM1MzY5TWcyRnFwK09keEIzeWJvbEZVbkQw?=
 =?utf-8?B?UUNpcTFIN3dlSXhKV1QvUDIyeUpYNDlWZGdNY3ZzZ3A1MHE0bEJpczRGYXBX?=
 =?utf-8?B?ZDFGaUcwTTRyRHI4bjJCZVlZT0t1L21vWUg1ZkV2QmJDdGw5Q2d6MDZPdHIr?=
 =?utf-8?B?b284K1pUaUpoZ0pwOW8wdUtCRlJkSUxyK0tiRWIxQ0tIUklhQmhrTmtjYmZN?=
 =?utf-8?B?VnpLQnVoVlRETTBtcnZ5Q01HN0grQk9ObTByMXhmTFVJcHZBeXdWRG5XQkk0?=
 =?utf-8?B?b0l6amRHOWtwRlRFbXRFOG9icTVWNDd4WmF1cmJXTUQ1dXMwbzJlOElpK3lB?=
 =?utf-8?B?bHZKalUzSjUyY2p4ekdhbWFDUkRjTG1leDdKRXVxQjJaZU0ycUJPNVBKQnlS?=
 =?utf-8?B?NE0xOUUzWWRnYk02S2l3WTNNWTRWc0R2SDdNN09IZW1WNDA3NjlBNWRmNjVL?=
 =?utf-8?B?N2kzdXJYRXVMWlhTNDcxOEpxZzZSMGNkT01aNFFGdlg5SDhQVmcxUUttZExL?=
 =?utf-8?B?OHJYazdKQzYxUFNvSmdsbEthNkJVTCtpUk1OQkxHb2FZUElkT0d2SG5xZlpy?=
 =?utf-8?B?S2pudW1CVDFXd3MzbEZ3VEtnNHU5MHdPd3dmd0hSNFV0QTFjMXJhT3J3ZHJ2?=
 =?utf-8?Q?pn4LxRVUT+eR0+sQ=3D?=
X-Exchange-RoutingPolicyChecked: 1cljRZ/UwRN/FerapRa1nzCramMHukPBmXeU+dgLgCmXbjJWwfWPpboL2/AFKRAMhOMHraYTO6FsUS2QZo0QvJ8oIK7Y7HGY6y2g9nSFw9QG1a3SAd+POA+JBs1jOrFDXQh5aboefICAc8qLaEEUDzEo0DR5zZg2aOhUWQ9FKF0fICOCNirRe9hStUzvoqELLy0xp525Fmqa0RXblHOqRMgSObAyXMvzcRncgiNbCTZCLnZKBFu4FT+nxOFdNzBs2Uyw7ATSvtWlu3H8yL5rkwQWDFpCuQo6N3EQAjt1phJQVNetHtdbCNbtQ4wJQW9rtBuTOMLaVZkvuc46RWTGEQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0ad0c7-f3cf-4a12-be5c-08df01cf7ab7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 11:04:34.0469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PU8rhXS1Rb9ZK0aH9slaNbbHVDlckgTD4DvMGD3la4max/rRIjA2Ato3oybM0IkCjBWgn2pszH0CLxEEo62Bpig19Y9X6lnT8EgnQOWkPak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8711
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



On 8/24/2026 7:44 AM, Tauro, Riana wrote:
> Hi Mallesh/Michal
> 
> On 20-08-2026 15:46, Mallesh Koujalagi wrote:
>> Make sysctrl_wait_bit_clear() return an error code rather than a bool.
>> and update callers to use xe_log_err() with the propagated error code.
> 
> Bit confused here on the usage of SIGID. My assumption based on documentation and discussion was
> that SIG ID is only needed for error logs based on severity and requires a resolution which can be documented.
> Am i missing something?

from "How to pick a SIGID (the uniqueness rule)"

 * A single underlying failure therefore legitimately produces a
 * *chain* of reports from different layers, each with its own SIGID -- e.g. a
 * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
 * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
 * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
 * follow a fault from origin to final effect; it is not a duplicate.

so in this case, some sysctrl timeout may eventually lead to a reset and/or
wedge and/or runtime-survivability-mode, and this intermediate FW SIGID may
help in any postmortem triage, and if we don't reach that final state then
we can still provide some generic resolution based on site and errno (COLLECT)

> 
> How do these errors indicate the need for a resolution.
> Do we need it for all kmd logs with components or for errors that need a recovery or can be recoverable?
> 
> Thanks
> Riana
> 
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 26 ++++++++++++-------------
>>   1 file changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> index e13eebaac1d0..ef847f0a8f2c 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> @@ -11,6 +11,7 @@
>>     #include "regs/xe_sysctrl_regs.h"
>>   #include "xe_device.h"
>> +#include "xe_log.h"
>>   #include "xe_mmio.h"
>>   #include "xe_pm.h"
>>   #include "xe_printk.h"
>> @@ -34,15 +35,11 @@ struct xe_sysctrl_mailbox_msg_hdr {
>>   #define XE_SYSCTRL_HDR_RESULT(hdr) \
>>       FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>>   -static bool sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>> -                   unsigned int timeout_ms)
>> +static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>> +                  unsigned int timeout_ms)
>>   {
>> -    int ret;
>> -
>> -    ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>> +    return xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>>                    timeout_ms * 1000, NULL, false);
>> -
>> -    return ret == 0;
>>   }
>>     static bool sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
>> @@ -145,12 +142,14 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>>       struct xe_device *xe = sc_to_xe(sc);
>>       u32 ctrl_reg, total_frames, frame;
>>       size_t bytes_sent, frame_size;
>> +    int ret;
>>         total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
>>   -    if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>> -        xe_err(xe, "sysctrl: Mailbox busy\n");
>> -        return -EBUSY;
>> +    ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
>> +    if (ret) {
>> +        xe_log_err(xe, SYSCTRL, ret, "Mailbox busy\n");
>> +        return ret;
>>       }
>>         sc->phase_bit ^= 1;
>> @@ -173,10 +172,11 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>>             xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>>   -        if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>> -            xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
>> +        ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
>> +        if (ret) {
>> +            xe_log_err(xe, SYSCTRL, ret, "Frame %u acknowledgment timeout\n", frame);
>>               sc->phase_bit = 0;
>> -            return -ETIMEDOUT;
>> +            return ret;
>>           }
>>             bytes_sent += frame_size;

