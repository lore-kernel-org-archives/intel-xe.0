Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978CDE92FD7
	for <intel-xe@archiver.kernel.org>; Mon, 29 Dec 2025 21:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE5210E516;
	Mon, 29 Dec 2025 21:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nI58O6Fc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3533C10E516
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Dec 2025 21:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767044256; x=1798580256;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P750vkKqe8R/XysNOn8ju+K5GCXKpmze1PM8FiTRrQM=;
 b=nI58O6Fcs991eTGkjlzLZrpUM/+kMvwGWiNV7nGWvjsgNHLYSYnUyHFd
 pU5opXt9xPtad7Xj62v4g5ecw8iAWQ93m2Zbdoi4ilNNsaKZzulqgoL3U
 DbBXyUwenr65skj3ZDw9tQlQH4GeEyYunpWBsHqeGt/sIYbBMokrkiv4y
 3uorSSMexqjw+2YPOmkyJCTT1UvmIfrnpEUDVbzE5fc3YPkmGN4wbxehV
 gYS4zpaIvN+brZjg27dK/o5c8K1cf8RFSnHK76F5wMrlRdJ+52iNHfu9R
 uVbgsbUIFaro9w9ZsftjLYRN9whHSRndSHArKrxbB5LKz0yEZ5EWbfpXx A==;
X-CSE-ConnectionGUID: MXS4drCWS9WDzH3aQF/QlQ==
X-CSE-MsgGUID: XeKIPq6CTQ+bFhQNKClwXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68539109"
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; d="scan'208";a="68539109"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 13:37:36 -0800
X-CSE-ConnectionGUID: OrGnD1rBTY2lvGCzSkoKfA==
X-CSE-MsgGUID: mF8kwG1ZQpmD1Mh/mOyKLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; d="scan'208";a="232080352"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 13:37:36 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 13:37:35 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 29 Dec 2025 13:37:35 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 13:37:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGR7uP+FtoVZkvHMD1t4/eQhVopM9SC0gFETgaDE9gvrF5TzID9Ysm70C6sFdHfhoy21vgqspLduEB9rASupu2+F8l3Ib6ygRoAkDdNTOD4boGSmEaIg/O8VFRXK5FitMFJ1e0v3mRaEkSBLcpbenTeHkqH7uAeTbogiaqr4CTc45TCbDB/YQ/0+TsN3rDR5eeXmra8/CauGUB0LkDFxXKV34EZbs4tQ3aW9twhAaa829FQsH1u05pA+W9XQQb8wvBhEPimu5MFRBDZ+w6I9yF+R+XwcoUz2jFOWChJqluRtB6+xLG5yCEnzZxWxHG8CPjLAJAx2KuDF/r3RmeczRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBG/Q1/tvddZozLoLhhg5hChDK7knokdkdw0+kKSKF8=;
 b=BwNmeWCiq2MXpqLF0CFm5RQvjEQr//UayhTH3XmD5DeuM1lnEx4YPgdJdG5WtxhM85Ggjo17MaKwDthUM4zOTN0m9umT1lV+fhbawXT4tNZbTHQRMnLp6LKXBqtp2UXdZsV/zvo+jf/9Oh1XOmybcMn6fEoA+c0tv8Xkd1xVIeKAvtZREf6wRh8oL/nb+jWlqCNDZPOJ9BSVwuSeu5pNFSWY9X6WmecQwBxIf8tUWmgoHDqPAlDVAWdThWODQSQCoY9y6nCoqj9Rcr0yCrmEICOBbVHHiY4ELNAR2CHpoeZzIDp8XSCT1EBh23gW3XF6LGSK80wyarqTjMClHjCr+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB6119.namprd11.prod.outlook.com (2603:10b6:8:b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 21:37:33 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9456.008; Mon, 29 Dec 2025
 21:37:33 +0000
Date: Mon, 29 Dec 2025 13:37:27 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Enable out of tree compile for Xe KMD
Message-ID: <aVL0lwd7EBrARLvf@soc-5CG1426VCC.clients.intel.com>
References: <20251224223046.2819609-2-umesh.nerlige.ramappa@intel.com>
 <b131c1d8e94335d679db480f1442b6836a6056e8@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <b131c1d8e94335d679db480f1442b6836a6056e8@intel.com>
X-ClientProxiedBy: MW4PR03CA0248.namprd03.prod.outlook.com
 (2603:10b6:303:b4::13) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB6119:EE_
X-MS-Office365-Filtering-Correlation-Id: 94ebc542-6774-4bdd-979d-08de472279bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGVCSDZXeFRrT215MlVNdVMxR20rVm9xL3dGUGVzbmp4MmlQbWVnVHo1SVor?=
 =?utf-8?B?SkxOYUFLaEtFN09qUmp2SWtWellGTEdaaDdLQW5pdW9SNFVuWitvUFNUVXA3?=
 =?utf-8?B?WGdvSGszMFUvSzJDeWNTeXpzRGdPb09xRDh6WW5KaE80U1pkUDZYYUt5aXZt?=
 =?utf-8?B?d3ZVRTQwVDREeFc3WmJLMmN3ZmJOVmJ6QWpiTUQwbmc3L2VqSTdzUEN6ckJP?=
 =?utf-8?B?UXkzZWtRWlZYanU1YzZKUlY2OERtZjRJNjJHY0xmUitxaGJGYnBiV0xSaU8v?=
 =?utf-8?B?cEl5RUtwMytJQm02RzBNRElxdXJrNDRSR3J6WGJvTFZsbUxQOU5NV0VoOE5m?=
 =?utf-8?B?WUdPY0FBY0s0T2I4RFJuWUF3L3dQNHo5dXNLUlhnMXk3YUxWOHJZY2xIUlg3?=
 =?utf-8?B?TktDUUYyQU13RWNYZUhXd2QzdnFOcWlNVUpPRUJjQ1lkbS8vcGxKL0Z3SWZy?=
 =?utf-8?B?MkNMMnJKNHlHVnF3NncvWUIrSXFQbFRZU0xMSElaeXhodHhScUo0T3FwUXpO?=
 =?utf-8?B?RTN4QTcyK21hT0Q0aXl2am1iZTFMdVBzNU41ZTJBczBaemNnVkc2TGxDanhT?=
 =?utf-8?B?ZFNBb0NiMXZSTmt3QTRiMktIWXFiQitRVHMxcHFBdElFaHcrK05Cc0c5eXd6?=
 =?utf-8?B?dHFYejV0WVNNK1JmS2t6bEhXaW9JRXMxOXpZaVJmOVV5QmdHaDhRTXVRcEJV?=
 =?utf-8?B?MHJoc095TXg4dWg3MUpTM2dlclM2blFjMXJhRVJUZ0JDVkJzT2R3NCt4Q0M0?=
 =?utf-8?B?Q2sxWmVYcXh2NHc1YU5SOFZjRnplUmYzaGRUNXZFOEpWS3dNYnp1TUhnNll3?=
 =?utf-8?B?MUNrUlhwcExlWTJlLzNwblVzNk5rNDZnS1JEaFg1d3lROHhQU2ZZWUZSemZO?=
 =?utf-8?B?R2dpZkxiQzQ5dEUxWjJUNyt6cXkxQ1RDanNJTUphUkZlV0kweUhpKzdYRzh2?=
 =?utf-8?B?NERtczArdjVyMXc3MjE1Q1hFQ1U0bk02RVhRKys0MllsVHhjaEUyeEQ4dHFC?=
 =?utf-8?B?dkQyMTJLRjNwekk5ZmVBU1h1ckFodkEwNkgzVG85OFVZaWVxeFZjTFZySm9K?=
 =?utf-8?B?T2ZoZDZiUmlZNk16TVI3bi9MWUMvTEVuRkxlQkFkeWQ4N00rYzJaYUlFTU9W?=
 =?utf-8?B?b2JjYWVZOEI0ZGNRN1IwVk9yOWhVNU9wTS9oUU5mZjBORGhmaVVYSy9zbWZI?=
 =?utf-8?B?M2IvRS9hNGxFTC9BR0srdWtmZTBOVTF0c2U4R2RnNmJkTmhCVDRaU2tFWjR1?=
 =?utf-8?B?c0RWZjhWU2JOd1ZNa0M0WmNkeGZOUnRYdXFQT2UvVFBzQXRTaXZQVU1reW1t?=
 =?utf-8?B?cUZUOTBabFZUYU5vTXdCcUVhRkx6Q2I4aWRHcklwc0dnRzFFY2pjMXFkRW5H?=
 =?utf-8?B?VVdWV3BFN05OZ09ZclI3VE52SkZPMFkvWWxSOWhSTmxtbzNjZlRPcWlsa0ky?=
 =?utf-8?B?c1J3alFmWXRyQWJQMFc2VzA3QnZjUXJqVDN0SEFlTWZ1MFNmaVJjQUw5bDM3?=
 =?utf-8?B?dGd6cG94cUlMYTVGZjlWVExvRnRjd2N6VExzWHhuVnJDeDlreVZHWnVWS0hy?=
 =?utf-8?B?Si81TjVQUXh5eWdXVXJWNjFhcThZNHZ2TVNVZGw3VzlVSEpzZlRRTStONnZn?=
 =?utf-8?B?RFBFSzRPTUE1NXdGL3RxWVhDdUpRamJ5cWU5ODdsUnNQZkcybjRjemZMQzln?=
 =?utf-8?B?YzdVazZqQVh1RFZ3VlJybUQ2eFpIY1licENRaHJGM3h5QWdsODZuV0xsaEhL?=
 =?utf-8?B?UVZFZ2xEbGFKcXZIZXZlMFdBWmgycGxsNkFNV09YbFJRSlZ2OVBCcU55MTNE?=
 =?utf-8?B?eDlmQ1YzSTQ3NkhUNmhQWUNIVEtGR2pZdU5EckczWTY2bmx2MEN4enVMMmw1?=
 =?utf-8?B?bSsrS0grZnN1bGRWcVo5NlBkYUwvY0oxVytaRjJ6YnVoN3N5STlvaDJBdjNU?=
 =?utf-8?B?TDlhczZDV3ZrMitnaWg4Y09NWVhGNUNlckoycHRvbXc4SHYrRXg3cXBKM3hk?=
 =?utf-8?B?MUtnVTFnT21nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0hvMjlPUHV6L2ZHa3lBMEtNRSt4dTRHeXhoOWtVTGg1cGk4UHhnM1lIL2lx?=
 =?utf-8?B?eWVMSHBzL3puWllKMWlUbnIwSTBrbVJtY3dXVGF1c0xTUlFVLytjbEdKa0dq?=
 =?utf-8?B?bFZaQXRBb2ZsNlcwM3NDUDdRZ2JMTTgySjE1RUVMOXVzSFpPMHJmK0V5VU1I?=
 =?utf-8?B?L0Zkckl6ZXFHeGNrZGZMRWt0T0R6N2c4T3dXbjdWSXBrOW5kVlBOcHY5Q2JU?=
 =?utf-8?B?NkdlT2VlVjdwN01qNGdpZ01BQ2ZZcjh3N0ZtMGlwMFg3S2hPQjdVQWlqVWNQ?=
 =?utf-8?B?MlJSU0REZFk0NnF1Y0lVWC9BZDVlbkhMTEFvTHU2UU5sZzZBRlZLTXhJTnhR?=
 =?utf-8?B?a1p3Y2U3eXJuWFFCakUveGUvUWN3MkNZZGEvR0s2cE8xTFlPbklMK3RDbVNM?=
 =?utf-8?B?UU1qWUpqTkxQYVZadk5tMEgvZUNTSUJVaTJlVWp6dU82STVoU1VmdGwrZUZo?=
 =?utf-8?B?MFkzWUkvOVVFa0JMT0pwU3VrcnFzY3N2cVc5bFhJQ25FMVNLK0NzRExXdjRO?=
 =?utf-8?B?WHNyZTBtQWUyZXo3ejZjRVhKR3dnL0k2RVpYOVhDTkkxaGFkczczNVVJY25r?=
 =?utf-8?B?c3hZUjVXZW14Q2htbzJCcFZVMDl0ZFZ0RDRoZ2paZXdMRE9ray9yQkgraW90?=
 =?utf-8?B?S1ZZNUNaQ3NFMVNoUHN3REJkTzFnaDZDQ3ZRczRsdnphSmxLRDVQdTQ0a2dX?=
 =?utf-8?B?VjZKOGdWcWhWeWtXbEkvS01OTjFXcG9seUVCNDI4bU1rYk1JVVZiaCtiRjJv?=
 =?utf-8?B?NW5ZQzhHcUlyUmdqeWM0bUptTWRBUmYyZ1NKaG1lQWY0ZW9pOWc2VlFiRVNt?=
 =?utf-8?B?NDg1WUsvSzQvbEdFcjZ5UCsvelNaekJvbU5jRE9QZTBnUTZJZjVMamJJdHhy?=
 =?utf-8?B?UlpuRHBxYjFlNWszbXg4b0xFcU9LR25XTThjUmpOVUdNOE1pMmErLzh2MmNC?=
 =?utf-8?B?T1R5ZWVYZVdNNG5nZXdmRnFyYytNYmpzMStSSnZ1ZkM1Zm9Rd2FYemJwZTRl?=
 =?utf-8?B?eUZDNGFYWXF0TklWaFRqWkdTcmJQeVVEWmFGTFFVQXZYVE9Bam9qWFJZcnBy?=
 =?utf-8?B?K2xVNEczeUF5UXNZcC9GWjFiKzIwV0Y0NmFLaDF2TTE3R29scGxSSkZKZSt2?=
 =?utf-8?B?WEZaYUYxSXA5SmNBdzVGV0lTY2U0dnpRNHFUMHhlbENlRDYyd0dmTlIrbk5B?=
 =?utf-8?B?OUVRVjFRYms0VUNnc2hqSTdKUzZENTZSZnlDdWh2dnNGdkpmLzh4UnAxai9M?=
 =?utf-8?B?VDFBQ3RsTVdiZS94d1NaYmwvSWhsZHFHd3VUQURKWDR3N1c1SkE4TGtDSE9n?=
 =?utf-8?B?bEIvdWhHYTllRmhkWXZseFhrVDdoNjlvajUxSFJYOTQ2VEFSSUJaUmt4S1VI?=
 =?utf-8?B?Z1BWV1pPbVhyQmVsK1NHeTJhemI3dzFlUXlXN1F6WjM1MjZqUlBzY0pIcFRk?=
 =?utf-8?B?b0JIZkhNSnkrMUltbSsyRm9QeVYya2VmU1E2K3ZidzhJcWtwVDZVUG9UYVFN?=
 =?utf-8?B?VTk5WTVreE5tWTlZc0hvRHBoQ2dML2hOeHZqL2hYVmROVUs5bi9zc3JBKzVH?=
 =?utf-8?B?TU9EWno2V1NPTzZWQU54WGhQUVRRSi9WUWNLa084bEVqM3Awc1d2cUFVQWlG?=
 =?utf-8?B?NjlQQlFjMHp6bDFSeURwQW56ZWMrTlI0T0EyOTVCS1IwYjkvbjJ3ZFhBcVdi?=
 =?utf-8?B?V3RHZFA5akdOQUQwSXJLV0E2Sk9LVDJ0MTBhdVp4VmsyN0lNUzlGZGFVa0tU?=
 =?utf-8?B?bEhQYVl2cjR5SENxUEtabmRvNFRIdGlJQVRraVhMclRGcm0yd3dUQjBlelNX?=
 =?utf-8?B?Wm4wQjRIWUpsR0VaZGkraC8wK0FobWFDUlBWby9wbTFoRUNLMGZSbnlIUnpz?=
 =?utf-8?B?Znhlb3VoZ1lIMVFYSmh1VWgwYy9ha1pmTm52Z0RWdjVYcGEvTnJYdzJDcHJn?=
 =?utf-8?B?cGZYNDB5SE5RWXcwOER0WWpiYkJVOWE2eXlEeEFuaEs4TGRYR0syVzR3OUhE?=
 =?utf-8?B?emw3MUNJOE5kalprTTFqVU1JdW1ueWtPbEMrTzZ0czkvT2lIWi9lSkl6V3RY?=
 =?utf-8?B?cy80ZTNxYVdOdXhSOXY2OXFSQlNGM241NFgvcGk2RHlxQURZK2xrVXpVMzZl?=
 =?utf-8?B?TjRZTzBRVUYzdlREbDI4eXRBK05tOXBZWFhRUXJIVGF3TStZL1lMeFU4emNH?=
 =?utf-8?B?VHozdkZhUnYwVWh4SjBnNS84MWQrc0h5VEZIL3g0SW85L3B5Q0VGQnNXam5O?=
 =?utf-8?B?TFhvV0FyanZ1cGNheDJqL3Z6RzhXVVZmcG4raWhYZURwSEVQdWtuWUN5VWpj?=
 =?utf-8?B?SlBwS2lhNVlWOWtlUVRKVjFjVE5sRlNkV2wzL0c1dDIydFNoZXdHOWF3NE1C?=
 =?utf-8?Q?0ZlaRoZWB425AAWFTvxqBKPkhVqDXCiwL303a?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ebc542-6774-4bdd-979d-08de472279bb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 21:37:33.1870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sani4B/tY0ulZcb20yUNi+Tavkrfs5TWQ4mcfgOC2pota90i0OZI+h5Lr8VHObJwtUGOlyesImr+lQaDDGM5V1u45OEfP6lAuQN2d8fHGJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6119
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

On Mon, Dec 29, 2025 at 11:10:56AM +0200, Jani Nikula wrote:
>On Wed, 24 Dec 2025, Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com> wrote:
>> When trying to build the xe module out of tree, the compile fails to
>> find the right trace header files and display paths.
>>
>> Both i915 and xe directories are copied to an out of tree location and
>> the usual commands to build an out of tree module must be used to build
>> xe.
>>
>> Based on the link below, modify the TRACE_INCLUDE_PATH to fix this.
>>
>> https://lwn.net/Articles/383362/
>>
>> In addition use relative path for display components in the Makefile
>
>Please don't do any of this.
>
>See include/trace/define_trace.h and the comment on TRACE_INCLUDE_PATH:
>
> * TRACE_INCLUDE_PATH if the path is something other than core kernel include/trace
> *     then this macro can define the path to use. Note, the path is relative to
> *     define_trace.h, not the file including it. Full path names for out of tree
> *     modules must be used.
>
>See also commit 4e6d7719bdc5 ("drm/i915: Use correct path to trace
>include").
>
>If you are doing some weird out-of-tree hacks, you need to keep them,
>well, out-of-tree.

Out of tree build didn't work for me without these. Maybe I am missing 
something then. Will look into it.

Thanks,
Umesh

>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  drivers/gpu/drm/i915/Makefile                      | 4 ++++
>>  drivers/gpu/drm/i915/display/intel_display_trace.h | 2 +-
>>  drivers/gpu/drm/i915/gvt/trace.h                   | 2 +-
>>  drivers/gpu/drm/i915/i915_trace.h                  | 2 +-
>>  drivers/gpu/drm/i915/intel_uncore_trace.h          | 2 +-
>>  drivers/gpu/drm/xe/Makefile                        | 6 +++---
>>  drivers/gpu/drm/xe/xe_trace.h                      | 2 +-
>>  drivers/gpu/drm/xe/xe_trace_bo.h                   | 2 +-
>>  drivers/gpu/drm/xe/xe_trace_guc.h                  | 2 +-
>>  drivers/gpu/drm/xe/xe_trace_lrc.h                  | 2 +-
>>  10 files changed, 15 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>> index 4db24050edb0..13a910a005fa 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -374,6 +374,8 @@ i915-y += \
>>  	display/intel_vrr.o \
>>  	display/vlv_dsi.o \
>>  	display/vlv_dsi_pll.o
>> +subdir-ccflags-y += \
>> +	-I$(src)/display
>
>In particular, I do not want display/ added to header search path
>here. We're in the process of removing i915 includes of display headers,
>and this makes it harder to track them.
>
>BR,
>Jani.
>
>>
>>  i915-$(CONFIG_DRM_I915_DP_TUNNEL) += \
>>  	display/intel_dp_tunnel.o
>> @@ -419,6 +421,8 @@ i915-y += \
>>  i915-$(CONFIG_DRM_I915_GVT) += \
>>  	intel_gvt.o \
>>  	intel_gvt_mmio_table.o
>> +subdir-ccflags-$(CONFIG_DRM_I915_GVT) += \
>> +	-I$(src)/gvt
>>  include $(src)/gvt/Makefile
>>
>>  obj-$(CONFIG_DRM_I915) += i915.o
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers/gpu/drm/i915/display/intel_display_trace.h
>> index 27ebc32cb61a..aa43f2a5510a 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_trace.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
>> @@ -853,6 +853,6 @@ TRACE_EVENT(intel_frontbuffer_flush,
>>  /* This part must be outside protection */
>>  #undef TRACE_INCLUDE_PATH
>>  #undef TRACE_INCLUDE_FILE
>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915/display
>> +#define TRACE_INCLUDE_PATH .
>>  #define TRACE_INCLUDE_FILE intel_display_trace
>>  #include <trace/define_trace.h>
>> diff --git a/drivers/gpu/drm/i915/gvt/trace.h b/drivers/gpu/drm/i915/gvt/trace.h
>> index 63874d385c6f..235d51ee48ad 100644
>> --- a/drivers/gpu/drm/i915/gvt/trace.h
>> +++ b/drivers/gpu/drm/i915/gvt/trace.h
>> @@ -378,6 +378,6 @@ TRACE_EVENT(render_mmio,
>>  /* This part must be out of protection */
>>  #undef TRACE_INCLUDE_PATH
>>  #undef TRACE_INCLUDE_FILE
>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915/gvt
>> +#define TRACE_INCLUDE_PATH .
>>  #define TRACE_INCLUDE_FILE trace
>>  #include <trace/define_trace.h>
>> diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
>> index 7ed41ce9b708..a074a5f542fc 100644
>> --- a/drivers/gpu/drm/i915/i915_trace.h
>> +++ b/drivers/gpu/drm/i915/i915_trace.h
>> @@ -721,6 +721,6 @@ DEFINE_EVENT(i915_context, i915_context_free,
>>  /* This part must be outside protection */
>>  #undef TRACE_INCLUDE_PATH
>>  #undef TRACE_INCLUDE_FILE
>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915
>> +#define TRACE_INCLUDE_PATH .
>>  #define TRACE_INCLUDE_FILE i915_trace
>>  #include <trace/define_trace.h>
>> diff --git a/drivers/gpu/drm/i915/intel_uncore_trace.h b/drivers/gpu/drm/i915/intel_uncore_trace.h
>> index f13ff71edf2d..01219e97574b 100644
>> --- a/drivers/gpu/drm/i915/intel_uncore_trace.h
>> +++ b/drivers/gpu/drm/i915/intel_uncore_trace.h
>> @@ -44,6 +44,6 @@ TRACE_EVENT_CONDITION(i915_reg_rw,
>>  /* This part must be outside protection */
>>  #undef TRACE_INCLUDE_PATH
>>  #undef TRACE_INCLUDE_FILE
>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915
>> +#define TRACE_INCLUDE_PATH .
>>  #define TRACE_INCLUDE_FILE intel_uncore_trace
>>  #include <trace/define_trace.h>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index a6749dd6a725..00aa4634f10b 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -201,16 +201,16 @@ endif
>>  subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>>  	-I$(src)/display/ext \
>>  	-I$(src)/compat-i915-headers \
>> -	-I$(srctree)/drivers/gpu/drm/i915/display/ \
>> +	-I$(src)/../i915/display/ \
>>  	-Ddrm_i915_private=xe_device
>>
>>  # Rule to build SOC code shared with i915
>> -$(obj)/i915-soc/%.o: $(srctree)/drivers/gpu/drm/i915/soc/%.c FORCE
>> +$(obj)/i915-soc/%.o: $(src)/../i915/soc/%.c FORCE
>>  	$(call cmd,force_checksrc)
>>  	$(call if_changed_rule,cc_o_c)
>>
>>  # Rule to build display code shared with i915
>> -$(obj)/i915-display/%.o: $(srctree)/drivers/gpu/drm/i915/display/%.c FORCE
>> +$(obj)/i915-display/%.o: $(src)/../i915/display/%.c FORCE
>>  	$(call cmd,force_checksrc)
>>  	$(call if_changed_rule,cc_o_c)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>> index 6d12fcc13f43..f3ef77e2bcda 100644
>> --- a/drivers/gpu/drm/xe/xe_trace.h
>> +++ b/drivers/gpu/drm/xe/xe_trace.h
>> @@ -515,6 +515,6 @@ TRACE_EVENT(xe_exec_queue_reach_max_job_count,
>>  /* This part must be outside protection */
>>  #undef TRACE_INCLUDE_PATH
>>  #undef TRACE_INCLUDE_FILE
>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
>> +#define TRACE_INCLUDE_PATH .
>>  #define TRACE_INCLUDE_FILE xe_trace
>>  #include <trace/define_trace.h>
>> diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
>> index 86323cf3be2c..8a687dcf09ba 100644
>> --- a/drivers/gpu/drm/xe/xe_trace_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_trace_bo.h
>> @@ -258,6 +258,6 @@ DEFINE_EVENT(xe_vm, xe_vm_ops_fail,
>>  /* This part must be outside protection */
>>  #undef TRACE_INCLUDE_PATH
>>  #undef TRACE_INCLUDE_FILE
>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
>> +#define TRACE_INCLUDE_PATH .
>>  #define TRACE_INCLUDE_FILE xe_trace_bo
>>  #include <trace/define_trace.h>
>> diff --git a/drivers/gpu/drm/xe/xe_trace_guc.h b/drivers/gpu/drm/xe/xe_trace_guc.h
>> index 78949db9cfce..aac9eebd4815 100644
>> --- a/drivers/gpu/drm/xe/xe_trace_guc.h
>> +++ b/drivers/gpu/drm/xe/xe_trace_guc.h
>> @@ -154,6 +154,6 @@ TRACE_EVENT(xe_guc_engine_activity,
>>  /* This part must be outside protection */
>>  #undef TRACE_INCLUDE_PATH
>>  #undef TRACE_INCLUDE_FILE
>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
>> +#define TRACE_INCLUDE_PATH .
>>  #define TRACE_INCLUDE_FILE xe_trace_guc
>>  #include <trace/define_trace.h>
>> diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
>> index d525cbee1e34..ada8f97a99e0 100644
>> --- a/drivers/gpu/drm/xe/xe_trace_lrc.h
>> +++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
>> @@ -47,6 +47,6 @@ TRACE_EVENT(xe_lrc_update_timestamp,
>>  /* This part must be outside protection */
>>  #undef TRACE_INCLUDE_PATH
>>  #undef TRACE_INCLUDE_FILE
>> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
>> +#define TRACE_INCLUDE_PATH .
>>  #define TRACE_INCLUDE_FILE xe_trace_lrc
>>  #include <trace/define_trace.h>
>
>-- 
>Jani Nikula, Intel
