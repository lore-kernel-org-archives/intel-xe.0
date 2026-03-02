Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B88EB363D
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 21:48:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3144010E5DB;
	Mon,  2 Mar 2026 21:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PH9VYxmb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49BC10E5DB
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 21:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772488136; x=1804024136;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HXI2ulteDXIs/GSBIvNniK6ON9MKpn8May7qDzaOKa4=;
 b=PH9VYxmbKA8To7d2yqyLkgkrJea7M5b7mC/EL7Ob+iEblAsOrAs5IJX8
 x98Noj4L62HM4R+rXe+oGnqo4C8VqPGuKu6Rv3u/RTAQf2m+r6d+zVUKz
 K+5McM06utz1o2CuuRwArCUx3eu0vQe9Dh1eUXGpcHRVORuLeMmmaYtwL
 1eXdOBy2m5M4vX8/yqnfbwmkkhLAEz+vMRGleApMXhN4ii2WZ+n3Tbad5
 ZQDave2q6Dakd3KXH6WYchpuZ8AseH/JOjLMuo2rvttklRgnKKVYUQYmv
 qgVjAYnf5ZLnywY9XPhbvwQVt0Ba9b58MhjdrXXGekKKAhXhrffRY2nZA Q==;
X-CSE-ConnectionGUID: WKSBezERTCWSIQVl6V9usw==
X-CSE-MsgGUID: zu00uKA6RKWmHsLloT4KuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="91083752"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="91083752"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 13:48:56 -0800
X-CSE-ConnectionGUID: q9DVOnc9TEm+VQiKETLncA==
X-CSE-MsgGUID: QC6rljh1S1mYtaNVjIiMNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="255651558"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 13:48:57 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 13:48:55 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 13:48:55 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 13:48:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IuvG1tQg034JL9bxU46XX1bP/JHtSo3+BwQi0tYRlV1C8fj5pMlWmGkc1r/SD5pecDM7B5xOQnDF9BzzuGw2jnUvbNK6MqONtUWJNmFJGSB1C78MIMo6D85OM2DcY3YviT+f2Xl0gEXKQh+xlD06WYIsnhyWkT3Fi8d75iH6Ocjn07QsOQuTX0ittVvenF9AaWDYfq4hG0XJbFHvzF5X8W158jIXY4CdUhHwvw/OeB68CdHqYQcde/7kVjtJnI5LkW4lEpB8iSYIVVfmf6knLULs0BTL7xMrp2ml95wLs3SQZqWQqv5dI1HzpdvmpJGThcSkCSU7+931kj9nGjQeuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5GDSL2eudKghhh77/LRBd5pp686qHijckXUOok2lI0=;
 b=nSGkgxRikUnoJm7TMsc+XwiluF3mP+nailNUmgRbPMiNPVe4T9ah35q9spB08mzCiul3F7zyTDhzUVDEfFQHW08TcWuq0HjG9OSEDpDEjXd/25u3A0eJbZWcRlOIyNDzdTff/5w77CfNaVzOpfoHreApQ7d2J+Wwl9yrWvSsoynubGcoNMRVOhK0NWGBy/7t/yI/jElQRVTM0PlWMCHoETL08u3iIAfCMzs45gmrp5px+uhBPPdCS7tCpPbwzk94uAQn4KbAOAA+wtpdw6R3K0HMT9prW8jjX1isGA06dNjo9OPhj7SfIuvWnsWDALRyH/npx0O4PaInLJvBBlUDGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH3PR11MB7938.namprd11.prod.outlook.com (2603:10b6:610:12f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 21:47:46 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 21:47:46 +0000
Message-ID: <30c186ba-8d1c-4c90-b609-58218f06c469@intel.com>
Date: Mon, 2 Mar 2026 22:47:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Take pci_rescan_remove_lock mutex when
 disabling VFs
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>
References: <20260227214048.12649-1-michal.wajdeczko@intel.com>
 <20260302094336.tdcyzx6kqkthfp4v@intel.com>
 <aaX0v0pezDvqt9mT@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aaX0v0pezDvqt9mT@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0206.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::27) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH3PR11MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: c3dafc65-2806-4deb-fd06-08de78a55747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 4LcrCb4HenAFz2E3cU7/h2KuODZ8l0yGwnN3/1Kq+gtv83Fn0AQbhVh65cKBZZbymd3yWznySO9wYJHey6cBBsi9AyNm1Xrm0JO8yvolJRw71w6dFapYXenYe1Zvrb07arO0dF4IKrAcxQr5lniShSnzbXPjUxTPXbslJwwnH+8zWRG2BlqwcT2Xd7St+eUfgjznlGDTAY6xBbREuep+Wkcd1QIQrgpVmd94EuEcTgz5rBNh5gGztNcXPnfbopKO6GR8oxTXM/BXkkidnOBiwhN+0DlskEcJZ0/qb/9jH520zfxgxmSF2qbODXW/NtoVUF8ZmNb5fNLlkfNNdLhhPkEFJY+1NYp1O4n2Gd+RdS0LqSXSSbJElzBqPnV2oajGjoPDhLp4O0Kat67Tcv+ro/vNXmcx8PaPc8h6wvSzF4FRWFswtHK9LrAaeE7hCINpGorTAGlAKD50ho0oUqDrBmrG5kpFdpBz75IiMLax43SNRryK/+Mn/S+wFSD7TMhm6znQZzFeD7bjNkGnO3tmrSdjvC1vrAn+foETYVz7p4TOzE9tp51EPZLET6t48mDlzUERYnoeuVFZl4L3EeqamV6W1pBDGTO2h9y6HIR1VI2zMyNXjr8DN8gDPwDUKAMCsCPxIQKZjQ1BjieCml8EL4DH7FH9YCgtgvV4OkZ/gDTMcBWL1q/P/RjNTK/nZazF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnlTSytkVHZxWFBDVU9ScURPS3Z2ZWdTaHFnaWhlT3RkclZPZThWTG9LRHF2?=
 =?utf-8?B?Q1p6akVtOGRhNHFkMzVGaDRIc1RiNnVsUklBd08rZUppOStJeGQ3ZEQyazk2?=
 =?utf-8?B?b1NVcDhaWkNZYXBNSWpVZzZFeHlGZ28wcDhaYUVrZVMvS3JaQmZ5WHYyRVZ5?=
 =?utf-8?B?TE5ySllzTWpRSndOOGVCK1NPWGhZUVRFczFwUm1ncVpmNDFLZHB2ZVFPSlhR?=
 =?utf-8?B?eVorNnRZOHBnUEo4TjduZHNDZW5RZy95QlgyYU90K3djNmUzcjhhbmUrNC9X?=
 =?utf-8?B?V2lqVDZnNWlRSmx1aUtVbjVQcTF2MlpUUVNaTzlnUGJsc1dHMUsyRG5nMkcw?=
 =?utf-8?B?T0FoMWNxZEpCRWRIalpZWGVEU1p6OWM3WFZYUXBwTWRnMDcwN2tVczcxRFJN?=
 =?utf-8?B?MHc4Ni9tb2dWeWFyWmNPb3hTNklaN0o0MFljVEZuYVovV0U0RWhoN2kxZWkw?=
 =?utf-8?B?Y2pWTURLanhPdUw1QmdQbHNpcXdpTDVUS1lvUmloRi9ZdXJEYW5RRitqaXJT?=
 =?utf-8?B?WnpXUjFhS2VWTUljQm9tKzJQTEo4Y2hvU0N5SGlWS2syWXQxWkhTMmhEcHJq?=
 =?utf-8?B?cVFHalJ3Z25yQ1ArRWh0TkRieGp3c3dSK3RwZVJORlhwaEdKMk9PM3JZYmd3?=
 =?utf-8?B?Nk1Pcjh2V1RWR3crTzRZT3phTTI3T0syc050T1BXWnh5eXJtTU9YNjdwRWdx?=
 =?utf-8?B?S3VVKzZVRng3Q0FwUDAyekJnRVBXMGFTSWRMSVlWQkxXZmM5UHgzMTNxL0la?=
 =?utf-8?B?aXJ5VWZMZkZFWWRBOVFoSXVvUTNDNWcxeXhyQ2lNekFGWUo2WlZhdmRLOXg4?=
 =?utf-8?B?TlFNT2tGRVlBQllOcENhRTM1dnBJSnVxSm1ON0N3SVdKQWJNc3lYOXJlTmNC?=
 =?utf-8?B?RUtMWnhiVGNTYUl6WWdNSDNDNDR2VzhHWHZ2WmJpU0I3Yk9oS0hyYlZwTWdX?=
 =?utf-8?B?U29na2tyRjByWnM4end5c2djR3BOWmY4ZHNONGk3U3RaZ2NnV2pmTGRBTUd5?=
 =?utf-8?B?Ry9MZURVZWtOSm55aWlxWU9OeitkVHRmT21aOXdTVWFCSWx2eFRwejJ5MUY5?=
 =?utf-8?B?VExBcUV5OGFUdUhpL3A5Y1c3ZXM0ZzRZb2lTazZSbzlSYzU2azNpY2hUNzVk?=
 =?utf-8?B?T3h5U1VXaUZSR01GMGh2YnRJZWNiRDBGY25tU1YvcmdOMTJBcnV2Wm8rbUlV?=
 =?utf-8?B?c0tYL0x4MjNKYll3L0RRc2hCbnQxNHg2WVpMMXNzdVgxQitWemZXbUZQN3lR?=
 =?utf-8?B?STB2anJnMHJCY2FnMkpJMitPM09BVU5pOEtyREhvR29jei80Sk5mZGM4Unc2?=
 =?utf-8?B?QXZZMndyemd1MDc2d2RBTFR6SWEzeDhVNll2YXVadWswZkQ0OXlrYVZxYXZX?=
 =?utf-8?B?dlVyOFJFSVg0ejhKNExpTEwvRnh5Yk9rNjZFL2xBZDNkNVJ4SzZtdHBZUDVh?=
 =?utf-8?B?ekd2V1ZXNmdUSmJ3cHN4MVNYMjRVWDhzd1BYdXFGUVl4VVREbnZpeFVQNk5E?=
 =?utf-8?B?V0tMd3F0RVNMbXUwZG15S3F5K2htS1d0ck9sVE9nbFdNL2l3S1dpRnRwYmVK?=
 =?utf-8?B?aEc4dEFHbHZyR3NLbmhZb0g1L0JvQzdkT2pwTENXc2NjdGVncW9sc1ZnSEt6?=
 =?utf-8?B?Smswb1R5dDZkbEJKSWszV3dOcVgzL2ZvVzErUXoxMURYR3NFV29TOFJyd0Vu?=
 =?utf-8?B?VSs5TlMvK2RVdzJwRjVKVUJMaEF6dVFsd2h3OUtaQ3E4L1ZNSlRLeGRXN2VY?=
 =?utf-8?B?YWd0eDE4cnIyOWdBQ0VhTStPS0VwdTVuNTJGV0ZJOWl1eEtLcXNkZUw2OVRG?=
 =?utf-8?B?WTNZMmJtd1I3Q1JYVzJaUWRrQmd0SjdQd1hiNEJGZ2JWK2pnZTBqeUViWW9m?=
 =?utf-8?B?K0N6dnJ2SE9POXZOOVEybTVvYytUWWpRWFRYMWcvWW1Jd2grMlVKNHpmaFh3?=
 =?utf-8?B?bU9FeWJRVnBMR1pFRXMvTUFZMWl4ZmEwK2JBM3RmZ1NoOG5mbzlvT1lVeTl1?=
 =?utf-8?B?Rzh0STRPSW94cHZ4Vjl6akZJRGhBK285NjVBZTJtS09BMGU0aWhWK01QTzJW?=
 =?utf-8?B?eGsvRnVaMmtDVHVoOFVRSHpuTTNCUEJoUHFySDdyUThDZ3g3NjZ1dW9nQTJz?=
 =?utf-8?B?VjhxQmFscUI3UGxLVW5pN0VYRFoxc21VR2ZYRlNmdlNVOXRWNDNlUEhkQXla?=
 =?utf-8?B?d2Q2T3ZFR0tWdlNmc3ZIOWJVTlFJL0M5WDRXVXloOFVNc0poQ1lsbGJHZ1c1?=
 =?utf-8?B?NGtNNHBjVEIza3FrNUpaZTdKTTEwWTJzeEJ0b3psbkJiUGprYW90ejFPd0NZ?=
 =?utf-8?B?eXp0OGxMcUlGLzJ2ekVZUkNwWklMbUtmdVh6Rk0vR0xuRElaTHhxY0Rsei9Y?=
 =?utf-8?Q?qyd7TFWj02R5yNjc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3dafc65-2806-4deb-fd06-08de78a55747
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 21:47:46.5172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKqdMQ1YbQ4YV9wnU3btLnybJ+h8C9UG++/fYPjdl52cMi3ZmCHHf+/62c3WmXiaMkcE0Tz3x1uJpEZ5cm8csrabhWPcxyGNXUF14yezZmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7938
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



On 3/2/2026 9:36 PM, Matthew Brost wrote:
> On Mon, Mar 02, 2026 at 10:43:36AM +0100, Piotr Piórkowski wrote:
>> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2026-lut-27 22:40:47 +0100]:
>>> Since recent commit a5338e365c45 ("PCI/IOV: Fix race between SR-IOV
>>> enable/disable and hotplug") the driver pci_driver.sriov_configure
>>> hook is called with the mutex pci_rescan_remove_lock already taken.
>>>
>>> As we are using this hook as-is during driver removal, we get:
>>>
>>>  [ ] xe 0000:4d:00.0: [drm:xe_pci_sriov_configure [xe]] PF: disabling 1 VF
>>>  [ ] ------------[ cut here ]------------
>>>  [ ] debug_locks && !(lock_is_held(&(&pci_rescan_remove_lock)->dep_map) != 0)
>>>  [ ] WARNING: drivers/pci/remove.c:130 at pci_stop_and_remove_bus_device+0x4c/0x50, CPU#32: rmmod/6476
>>>  [ ] RIP: 0010:pci_stop_and_remove_bus_device+0x4c/0x50
>>>  [ ] Call Trace:
>>>  [ ]  <TASK>
>>>  [ ]  pci_iov_remove_virtfn+0xd1/0x140
>>>  [ ]  sriov_disable+0x42/0x100
>>>  [ ]  pci_disable_sriov+0x34/0x50
>>>  [ ]  xe_pci_sriov_configure+0x2d0/0x1150 [xe]
>>>  [ ]  xe_pci_remove+0x7c/0x190 [xe]
>>>  [ ]  pci_device_remove+0x41/0xb0
>>>  [ ]  device_remove+0x43/0x80
>>>  [ ]  device_release_driver_internal+0x215/0x280
>>>  [ ]  driver_detach+0x50/0xb0
>>>  [ ]  bus_remove_driver+0x86/0x120
>>>  [ ]  driver_unregister+0x2f/0x60
>>>  [ ]  pci_unregister_driver+0x22/0xc0
>>>  [ ]  xe_unregister_pci_driver+0x15/0x20 [xe]
>>>  [ ]  xe_exit+0x1f/0x34 [xe]
>>>
>>> Fix that by taking a pci_rescan_remove_lock as it is now expected.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_pci.c       |  2 +-
>>>  drivers/gpu/drm/xe/xe_pci_sriov.c | 20 ++++++++++++++++++++
>>>  2 files changed, 21 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index 3ac99472d6dd..fb0abd768e67 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -1010,7 +1010,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
>>>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>>>  
>>>  	if (IS_SRIOV_PF(xe))
>>> -		xe_pci_sriov_configure(pdev, 0);
>>> +		xe_pci_sriov_disable_vfs(pdev);
>>>  
>>>  	if (xe_survivability_mode_is_boot_enabled(xe))
>>>  		return;
>>> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
>>> index 3fd22034f03e..2a3fd3578ef2 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
>>> @@ -239,6 +239,26 @@ int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
>>>  		return pf_disable_vfs(xe);
>>>  }
>>>  
>>> +/**
>>> + * xe_pci_sriov_disable_vfs() - Disable all VFs.
>>> + * @pdev: the PF's &pci_dev
>>> + *
>>> + * This is a simple wrapper around our function that implements the
>>> + * pci_driver.sriov_configure hook but also takes a required mutex.
>>> + *
>>> + * Return: 0 on success or a negative error code on failure.
>>> + */
>>> +int xe_pci_sriov_disable_vfs(struct pci_dev *pdev)
>>> +{
>>> +	int ret;
>>> +
>>> +	pci_lock_rescan_remove();
>>> +	ret = xe_pci_sriov_configure(pdev, 0);
>>> +	pci_unlock_rescan_remove();
>>> +
>>> +	return ret;
>>> +}
>>> +
>> LGTM:
>> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
>>
> 
> The lockdep reasons and the placement of the lock make sense to me.
> 
> I do have a question though, as I’m a little concerned about our driver
> having to take a lock like pci_lock_rescan_remove...
> 
> Why is the xe_pci_sriov_disable_vfs call needed in pci_driver.remove?
> In other words, why doesn’t the PCI core call pci_driver.sriov_configure
> first?

dunno, but it does complain [1] when PF leaves VFs enabled

[1] https://elixir.bootlin.com/linux/v6.19.3/source/drivers/pci/iov.c#L1027

> 
> I don’t see many examples of device drivers having to call
> pci_lock_rescan_remove [1], which is why I’m asking. I’m wondering whether we
> are missing an accepted flow for SR-IOV, and whether the need to take
> pci_lock_rescan_remove just to silence lockdep is pointing to a larger
> issue.

at first I was assuming that there is just a new expectation for the
driver, but indeed it looks that we have a larger problem, as our CI
also found that in slightly different scenario [2] this mutex is already
taken by the PCI subsystem when calling the .remove callback:

 [ ]  Possible unsafe locking scenario:
 [ ]        CPU0
 [ ]        ----
 [ ]   lock(pci_rescan_remove_lock);
 [ ]   lock(pci_rescan_remove_lock);
 [ ] 
 *** DEADLOCK ***

 [ ] Call Trace:
 [ ]  dump_stack_lvl+0x91/0xf0
 [ ]  dump_stack+0x10/0x20
 [ ]  print_deadlock_bug+0x23f/0x320
 [ ]  __lock_acquire+0x146e/0x2790
 [ ]  lock_acquire+0xc4/0x2f0
 [ ]  __mutex_lock+0xb2/0x10e0
 [ ]  mutex_lock_nested+0x1b/0x30
 [ ]  pci_lock_rescan_remove+0x17/0x30
 [ ]  xe_pci_sriov_disable_vfs+0x12/0x40 [xe]
 [ ]  xe_pci_remove+0x7a/0x180 [xe]
 [ ]  pci_device_remove+0x41/0xb0
 [ ]  device_remove+0x43/0x80
 [ ]  device_release_driver_internal+0x215/0x280
 [ ]  device_release_driver+0x12/0x20
 [ ]  pci_stop_bus_device+0x69/0x90
 [ ]  pci_stop_and_remove_bus_device_locked+0x24/0x60
 [ ]  remove_store+0x85/0xa0
 [ ]  dev_attr_store+0x17/0x40

but it looks that this issue was already noticed and discussed [3]
in the PCI level, so lets wait and see how this will be solved.

[2] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162346v2/shard-bmg-7/igt@core_hotunplug@unplug-rescan.html
[3] https://lore.kernel.org/linux-pci/20260228120138.51197-4-ionut.nechita@windriver.com/


> 
> Matt
> 
> [1] https://elixir.bootlin.com/linux/v6.19.3/A/ident/pci_lock_rescan_remove
> 
>>
>>>  /**
>>>   * xe_pci_sriov_get_vf_pdev() - Lookup the VF's PCI device using the VF identifier.
>>>   * @pdev: the PF's &pci_dev
>>> -- 
>>> 2.47.1
>>>
>>
>> -- 

