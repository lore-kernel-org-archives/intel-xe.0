Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269FDE7E0CD
	for <intel-xe@archiver.kernel.org>; Mon,  9 Feb 2026 17:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE31F10E366;
	Mon,  9 Feb 2026 17:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S2VWpcUZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F34710E366
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Feb 2026 17:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770656861; x=1802192861;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yaN7P1sOPF8oZfC2oYtzkcwRmxLueLT1NdYQCAzOwNo=;
 b=S2VWpcUZQT3xOlu7E5voekWwJpWoGCNGbORgNLbKLM1BjzmAWLjdPdk3
 MOUv6PfCJoIzT5AQWl2nbTgGBzfDusRpk/gDvJsHuN48D7ut7lZXqqiln
 AiEI3wnHf9hRwQprlyMI/5Xi/tYp0T9FJKTVVeE+FmtAGdQoo3jnPRlX5
 nAJk+6NcFd9D0ib3QCvN9IUa4sOduLdvDGu2k4Srh/EyRIhKeO2Ba5YjN
 yZQ/FT0oQIfhAY6FJzYP7HIPY14LMLuF5LWDb0CdpLSZryYQsyG506bey
 38bdugHqQdTtLeu/oGIx1egh0eylPSd+Tz+85WzLRz8ee/h61OeE4Ab7x w==;
X-CSE-ConnectionGUID: e80OjEPMRPWWuK/5hP85bg==
X-CSE-MsgGUID: uL0gjF45QaC19p1E0EY0xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="94416510"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="94416510"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 09:07:41 -0800
X-CSE-ConnectionGUID: WhsIW6TEQQ+0vRRqFVmXcQ==
X-CSE-MsgGUID: PJl2h+eyRAiNRD40Su6qpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="215825374"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 09:07:40 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 09:07:40 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 09:07:40 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 09:07:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tq4dFpMWlOT6tszvCaYgkrN9By8bHKbq3Gkj3HLSmvx4rBs6jGEpmbrG6OwXDVqQOTXXs1SzgdTWXpiH3vq6LDvBZOvYk37hpT9obzofOILddHlLvect1yYxEEFgA1DcpyfXoPo65NU5WwKAepjMGdytgfB/JOnsRTjdTX2eI+XIYluVKnq5b81SjfbH1ryyMg3apbAWbJjBS384zPo9GTe7W3oIWupa0XeUd1ffqCsgIH+4v3YpFIFrf9l6omgLDYnDqxHPVyeTKdzOztfAB9nEomEiuocxkHknZJAFh9dunYX6KiUkunH/ErlJGTGBXuAiQaOMdEQaWJn+NDga3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a93lptbPqFVdSi3MK+zL28WjLFdzrwCL8AeGfksOqOY=;
 b=LrZ0rM0NvLcp2a+9NmqmkFwprbg1L+RL9QS9Lq7Kvqz4Mw+oLdLs3gjSZasWimKNSnEMkA4WH6H+VttEUixZ1PeMEViOdgF//dtSGvlcpq4o+2MqNiCLOxf0ZEffb6sHeZBEIXwCiwxfwQtHLhWIS2iWV2+W4nkJsIOEiLpd2YbRkMnVQAGIzDkW1NjBfLTB7idTuR97WTswSuN/v0I/p9y9YXelaVedB4K4Cf1NCd1Jz9szBUU3SU0SdKSKr0tcqhobIDVUKws/tHJi8a5M3KJOh/t2Q2TtaqDXZ8NJmj3lDwdDrR1pQHV0JNVmRpLmOIA+E8LG4lpAttqeVu1Npw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB9040.namprd11.prod.outlook.com (2603:10b6:208:576::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Mon, 9 Feb
 2026 17:07:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 17:07:36 +0000
Date: Mon, 9 Feb 2026 09:07:34 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe/sa: Add lockdep annotations for SA manager
 swap_guard
Message-ID: <aYoUVnkDNMit8tnx@lstrano-desk.jf.intel.com>
References: <20260204164642.3509298-5-satyanarayana.k.v.p@intel.com>
 <20260204164642.3509298-7-satyanarayana.k.v.p@intel.com>
 <65de6e6accc8e4344d9d068523fe01a6ecc3cff0.camel@linux.intel.com>
 <aYYy6S+wb7LFA0G0@lstrano-desk.jf.intel.com>
 <b5ca8f95ae165a38cf5aa95d1aabd8e6c60847eb.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5ca8f95ae165a38cf5aa95d1aabd8e6c60847eb.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0354.namprd04.prod.outlook.com
 (2603:10b6:303:8a::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB9040:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c1dc094-a722-4cb5-5145-08de67fdb953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFpmNnNiNmFiTUUwVDc2eWJXNGFxa0pQekMySnQyRzI0OEFUK3VNTGtCTDdU?=
 =?utf-8?B?MmlVc09jMEd2VDJaRWpMT1FiMnhYRy9oL2FySHpzTEhzRTZwM3Z5RXpEMHRG?=
 =?utf-8?B?UTNlWG9sdG9IVmxIcFBTM1YvRWNCbDZyMnNOekFxOUxDUVdOTlpZMTBLbUNL?=
 =?utf-8?B?ZDR0NG0zT2lTbXRGZEQveEw0U2huSzlld3RIdjNwdTFMNVlkMnh4NEN3cXdH?=
 =?utf-8?B?NUdraW1QZFl6L2lRN2dJMCtPK0RuRjlYd1pkSklTenJNN1IrQnpzWlZuNUFw?=
 =?utf-8?B?Zk9vajFrMDJJMm9vTVdNTFdWb0NKUjhLSmxnYUYvNTkwclZKOWI2RS9FaTUy?=
 =?utf-8?B?RVpLVjBlb0c0K2xmcU0yMmpZSVpkckJDSXJ3MGJXYmRpMjlzU2VhenkxeDR3?=
 =?utf-8?B?Sk1iNTAxMFcxZDJhRERSZUVVS0ZEYUF4bk1IZGU3YXc0OWd1NW15bGlSbjRM?=
 =?utf-8?B?OTB0S04yZDE2T3Uydk9CZDROUFluWDcwektRZ0tVRThqd3dUVFVNYTQvNitM?=
 =?utf-8?B?aUZQdFpzSWlwaGpIYk1ZNExpMWMzdll2eEprd0NWZW5zdmxIM0JIWFozbzF6?=
 =?utf-8?B?b1Mva0RJdmFFeDlKUUZSbDhPa3VaU1hJUFRiaFY3NFRzTHFRSjBVMHJUbVc1?=
 =?utf-8?B?TDlJc1F1Zi9vLzRsb2ZKbmN4QVBSS0ZHQlFTaCtWM1oyNnlTRmxzWnhxM2t2?=
 =?utf-8?B?UlJ4SDVJQTRwTmVkdTIzQUIrdEs5Z3N4OTJRcE1GUGpoQkFpSVQrc2JtR05T?=
 =?utf-8?B?MGJkMHdRVkw2L1duZ09GKzl3Wk1uVFIxNmR6eG1WQWFGQnRTaWdCbWY2Rk9F?=
 =?utf-8?B?Zjk0R0Ewb1lGbVB0N3ByT2JsMjNSdFlxS3M0QVdhTnJPNVQ5Mm9CZEhvRWhI?=
 =?utf-8?B?V3Y4d3ZVK0M4SGlJRXo5MWlvMTE2SXVaaVRCdk1VdHFjeG5JcGNMRlRZNWo2?=
 =?utf-8?B?MlBDVkhVRkpaQkFxTkNxNUgvdnc3SktYRWRRMEovUVFndzdDV2QrQlk4NXJy?=
 =?utf-8?B?VE5WekthejIrVmZGKzducjVIQTVFTXc1cEdGd2RmMTJRQmhMaStZT0p1VjZj?=
 =?utf-8?B?d2wvUXJoQTFReVBocG1LWlFPam1OcDdyVy9qN0FKR1dCL3RWS0EzcEt4WVhL?=
 =?utf-8?B?UkZGNUFBR0pWa2huelVDZlp0WWp0Y3BqTzRQMit4ckY3UGViemxBV2ZRdVdU?=
 =?utf-8?B?NzZoUnJGaXNwODVMK0x5cFNQM2hnQ2g2ODF4Y20zSUZEczNkN0hIb2VtSzZD?=
 =?utf-8?B?WnRHcFhPSUx5SnI2TnpiWENmU0xaRG9mWm5pWXZkei9jb09FdWhoK3lhMmh1?=
 =?utf-8?B?Vm1MT2ljYkJIMUxUb0RyMmRWcGNEaGhqR29lcHFMaCtpWTlBTC84QXEwVS9q?=
 =?utf-8?B?OUpKSHg2N2lLY1lzSGRrVm9sbG9YQnRETFJJU0JDNksyRDJvRGJDczR1T1I0?=
 =?utf-8?B?ZFAvYk9ob096QU41ak9mNm4xNXQvSnZPZFp4NU1uRUpTMWlVdTFyd0pkUzlj?=
 =?utf-8?B?ZHpESFNaVFh6RisvQlBZZStBUThTeFl5OWpmYm5tYmxDalRvT244YjkyVU1r?=
 =?utf-8?B?eWtBRWtjMDJ3YnVlb0VBZCtNM0UvZ3ovRmNEajRKZ0MrdXpMSmNicGVVdkdk?=
 =?utf-8?B?RW54UUN0OW1YelRjMjVVTzlpU3kyQk8vSFgvczVsVWRNTmNXRHlGMDJUdVBu?=
 =?utf-8?B?d0dObnJZU0QvV2UrSEVGLzlRNDlzQloxMUQ5QmlCczNwMmJHUktqTWV1MzRD?=
 =?utf-8?B?NzJOd3lGa0VxN2c4MGZvVmRtVHkwSDE5VkdqL1NkeW94eVdhMHVtRi83NVZP?=
 =?utf-8?B?cUdKZm9uQXNoWXlqOWhiUi8wV0tYRzNVZXd2NmVCb25ramZHMEdyU25IRkxL?=
 =?utf-8?B?MTlHYm9XTFVPT01LTWV2RUJ6bURKVk1weHZ6Z0RLNWZ3Qkp6WDBuZVJhUWda?=
 =?utf-8?B?T0luUDdxOWRZQkxYb3ZxemdZMlFSWGpyL2JiYUxUTXlBK2UwbGZOWCtTWXlN?=
 =?utf-8?B?a2oyL2MxZnMrVXk4YXBQYUMzbEY1U3l6N3VGdGo3eFVZdWx3L256UzJZUE5i?=
 =?utf-8?B?NVhFQlU5YlloU1ZDOXRXeDczRFZtS21nRGg3Nk9JQ2RBQ0l3Qlp2YXZ6a1Ew?=
 =?utf-8?Q?Rmh4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGtOUmZCTXQ3QVFyaWJzMk5OUkdBbE5QM2REUDVlUndEcUFtb3I1WXN4Q1I2?=
 =?utf-8?B?Wjl2M0dpSU9lc1BNZU1mVDlYbEFab3gza0ZYeERsNzZzZ1ZmWndJM1BFVDNm?=
 =?utf-8?B?dm5TQmpDdHl0aEtJTUJ6SldxWEZiNTRxY0FmMlV4cUU2VEhjNjNmVlFjaUFi?=
 =?utf-8?B?WEh4ak1OajltRGQxaW10dkd2RnJJc0J6SWlZTHQwR0FoTEF5WnJFVTA3dGJ5?=
 =?utf-8?B?cWNkZjlya25HUlhZdWMwNENPL0RNWEZBQytKZVIxMjk2RCtpQW1PczgrYTVE?=
 =?utf-8?B?WVJNTXBnVUVZVEhuY0o0STNEdkpmWGhWbkR1NkYwVGZnREo4eUlPZFUwZ2xt?=
 =?utf-8?B?ZUtySkxPVnAzNmsvUlpnVlduOHBBdG15eTNkZDVxajY0WDkrZGNGQ1ptcWJU?=
 =?utf-8?B?ai9JemVlRGpGMVJUc1AzMmd6MHlBTGppd09KZDl3NzFKMWRBYm9paFp0TitE?=
 =?utf-8?B?eUNWL3JkV2hONmcwQUJ2bFc1QnRsMEY5Z0hLL1BIaUxNeU9LajAwVmMxVlNN?=
 =?utf-8?B?NlhVMDdMUk5SekVDZ05obDgyL25jK2hERGVQZkd2WmdHaVdEalcvd1lXcnN5?=
 =?utf-8?B?VlNKUE5ueFVJeEJWRTBnVlk4MVVpN3pnYk1FY2tid0VWWllGb3FDaytEQkls?=
 =?utf-8?B?alkwWmE5czFVQkRiVkU5RkduSk9wTzFRUnpXWXNma3c3S0Izb1ZsREJpVE91?=
 =?utf-8?B?b3BabjI4N3prMnUxVkJpVVpaVEJDL1RwTkwxN2Nia09pNXU3TnhaQ0lMRkRu?=
 =?utf-8?B?Zk1rSmsrODZEUVFVdy9ZNzcxc0NqOW4raitVRlI4bTdxSHpyeVRBb3YxOWVu?=
 =?utf-8?B?ZjF0ZDV6TVRzaG5FanhhMFdBODh1by9rSU9acTF4SHhjYzFZVlROU0NVcFQy?=
 =?utf-8?B?YzJvd3NMYzhwQVhiSTNyRnZYSXNKb0lFSDVtL0hEN0oyTVlBa2VNTThOMHpO?=
 =?utf-8?B?bjlMWURIVU9UenY4VXhkRDVZZ0d0OTdzMWFjRXBFSjdKeWZqVklJSWhueDE0?=
 =?utf-8?B?bk80QWtsSzdWUmVOa1dSaEVCcUxYWXk1RUdOek9Kcis1UU85TjY3aEQzUUdR?=
 =?utf-8?B?OThQK09Pc3RiYnVLeVoyaExHUUttNWNJMGxNeElSN1NLdDArRVF5YWl3R2lW?=
 =?utf-8?B?N095WWVMeGVKaUlSNVBxZHRCK21DZi9SSmRIY29LanMxc1Nxa1BTaEJWUDBL?=
 =?utf-8?B?ay9tY20yTzVvWkpTWVlIT2Nna0ptUmkzTWtwSU5ER1MzbU8waGt3bHhRRXFX?=
 =?utf-8?B?UTVNMG5uQ0Vaa3c4alhKM1ZmK0EwT2M5WmNnRExCeThLUkMwTlFVc2JhVGtq?=
 =?utf-8?B?c3FTOHR3NGFJY2VHd0tUYWpVTElILzZzaEp0bm1kUVJXMVlPbWpOSnNvNElm?=
 =?utf-8?B?UTNZalVyazdBVjJ1MTB0eWsrL3VpeVp1czhWTEsyK1VFTnNlNmVnVjljbm1F?=
 =?utf-8?B?QVJ4MitVODhJd3hXMUhWRlVVbU5QSlIzMUtpVzQvSFRtc0E1bWl4THEzbTFH?=
 =?utf-8?B?V2ZDQ3VNMGhXdk1YRks5YjdOMWZJSW5uRWR6Z0pqUWtCN0tRZExocUQ2Qlhq?=
 =?utf-8?B?VTdQYnp3UmtXM3dMR2hvb0FFanVSZ0ZJaTB0d28zMmlZUEZpUmY3L2pmeEUv?=
 =?utf-8?B?dkxWOGhrY2gwaEtveCtIeHk3NWlDVFBQTk9DZFV1M3FDcjBGVVovamZvelcx?=
 =?utf-8?B?WTQzbDFBZjZCeDQvbGY3M3V5aW9ja05mRC82SEVRQXFJR2dscGw5NjVtbGRm?=
 =?utf-8?B?YmdKUDVWSkVETkNKZGl6WkRyKzk3S3diQXQrYVR4U0dSVGxsODJTbitqK0sy?=
 =?utf-8?B?MXJTWm44REFvMmxmUW55ZXVzSFd0UHV2dDZMaHJPcnNBWFBWcTlRaW9XNkZn?=
 =?utf-8?B?cHJDcCs5bWNUWVFNSGN0K0hYRTNQeHJla0FkWUI0em5aY3R0aDJFMWhkekFG?=
 =?utf-8?B?UWNOeS9ZUEVqbjVDNUYrTm56eHR1VjFQSTRuLytNL0FveFJidzIzMHhVTzRT?=
 =?utf-8?B?UkloTCt0dVl4MGk5ZkN4Qm5QRjlOVzU3US9nU05lZEJKMWJUR0FYL0FrM1Ez?=
 =?utf-8?B?bmR1QUpUTWtvYU1jVHc2RGF1WjdvZ1c5RlppT05Kb3hzdVR4NnJiRVYrYktw?=
 =?utf-8?B?QW9ld0RVNVBSVUxuMER2c1FZbE5VQS9yUC80N1dMa0J1YjBoVTQ5OFlLV0No?=
 =?utf-8?B?NmVEOEdlNDZkdHI1by9DT2dGNkdYSlI3a2ZhOGo0bC84UEZzMmc4S3pqekJw?=
 =?utf-8?B?U0hDdzdOeUhONFVrdDl4TmhTOWtkTjFKMVdNZjA3clFSNW1MMmVoVWhXb2ZZ?=
 =?utf-8?B?WXRudjkvZVo5UlQzLzN1cHlUNGlYQWYwUFRYUjFpK1dLNmlMNS9QaVR4c0hw?=
 =?utf-8?Q?+rqBFrWP68wf4gcw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1dc094-a722-4cb5-5145-08de67fdb953
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 17:07:36.8190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MdWeuylpcq3AGPC0cfY9qiLeEI7V0C+43oa2W3c8QhOtGUq6dbJStIFrjaxsInEJhXETymDx/1ffpwops8YVcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9040
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

On Mon, Feb 09, 2026 at 10:09:11AM +0100, Thomas Hellström wrote:
> 
> Hi,
> 
> On Fri, 2026-02-06 at 10:28 -0800, Matthew Brost wrote:
> > On Fri, Feb 06, 2026 at 05:17:46PM +0100, Thomas Hellström wrote:
> > > Hi
> > > 
> > > On Wed, 2026-02-04 at 16:46 +0000, Satyanarayana K V P wrote:
> > > > Annotate the SA manager init path to model taking swap_guard
> > > > while
> > > > under
> > > > reclaim context. This helps lockdep catch potential circular
> > > > dependencies
> > > > between fs_reclaim and swap_guard in debug builds.
> > > > 
> > > > Signed-off-by: Satyanarayana K V P
> > > > <satyanarayana.k.v.p@intel.com>
> > > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > 
> > > > ---
> > > > V1 -> V2:
> > > > - None.
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_sa.c | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_sa.c
> > > > b/drivers/gpu/drm/xe/xe_sa.c
> > > > index b738102575d4..5efbb5a09f77 100644
> > > > --- a/drivers/gpu/drm/xe/xe_sa.c
> > > > +++ b/drivers/gpu/drm/xe/xe_sa.c
> > > > @@ -89,6 +89,12 @@ struct xe_sa_manager
> > > > *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
> > > >   if (ret)
> > > >   return ERR_PTR(ret);
> > > >  
> > > > + if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> > > > + fs_reclaim_acquire(GFP_KERNEL);
> > > > + might_lock(&sa_manager->swap_guard);
> > > > + fs_reclaim_release(GFP_KERNEL);
> > > > + }
> > > > +
> > > >   shadow = xe_managed_bo_create_pin_map(xe, tile, size,
> > > >         XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > > >         XE_BO_FLAG_GGTT |
> > > 
> > > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > 
> > > In addition to this, a couple of comments to the code that is
> > > already
> > > in the driver:
> > > 
> > > It would be beneficial for understanding if a document section was
> > > added for the typical usage flow of the shadow buffer, something
> > > like
> > > the below (hope I got this correct).
> > > 
> > > *) Clearly stating the use-case: That the whole buffer is bound to
> > > HW
> > > and can execute at any time. The shadow buffer is part of a double
> > > buffering scheme so that updates are visible to the hardware
> > > atomically.
> > > 
> > > *) The flow:
> > > -lock()
> > > -Swap buffers: The buffers are identical. The buffer bound to
> > > hardware
> > > becomes the shadow.
> > > -Update the primary buffer.
> > > -Flush the cpu buffer to primary on DGFX (BTW IIRC this was missing
> > > in
> > > the code). -Point the HW to the primary buffer.
> > > -sync the shadow to the primary.
> > > -unlock()
> > > 
> > 
> > This is is roughly correct. I agree a kernel doc section would be
> > good.
> > 
> > > In addition perhaps more lockdep asserts an also perhaps pin the
> > > lock
> > 
> > More lockdep is also good. What functions do you think are missing
> > asserts?
> > 
> > These are two possible ones I came up with:
> > 
> > xe_sriov_vf_ccs_rw_update_bb_addr
> 
> 
> > xe_bb_ccs_new
> 
> These are possible candidates, But I was mostly thinking of the xe_sa
> functions involved in the above flow. So that would essentially be
> xe_sa_bo_flush_write() missing asserts.
> 
> 
> > 
> > > in swap buffers and unpin in sync to shadow so that if anybody
> > > releases
> > 
> > Pin/unpin isn’t a bad idea. We could also have xe_sa_bo_swap_shadow /
> > xe_sa_bo_sync_shadow acquire and release the swap lock, since that
> > clearly
> > defines the critical section for this lock - what do think?
> > 
> > > the lock in between you'd get a warning.
> > > 
> > > But this can be done as a follow-up, (beware the possibly missing
> > > cpu
> > 
> > There are barriers in xe_sriov_vf_ccs_rw_update_bb_addr, do you think
> > anything else is missing?
> 
> Yes, on DGFX we maintain a system memory buffer to avoid read
> operations over PCIe. So writes to the sa memory doesn't immediately
> appear in primary gpu memory. It needs a xe_sa_bo_flush_write(). I
> might have missed it, but I don't see it in the code?
> 

You are not blind, that call is missing. This is a iGPU feature only, so
it isn't needed but for completeness / future proofing that call should
likely be added in.

> Also as an unrelated item, I think we should use scoped_guard() instead
> of guard() for xe_bo_swap_guard() to clearly mark the region where the
> lock is strictly needed? Would make it easier for a new developer
> reading the code or somebody updating the code at the end of the
> function to not add unnecessary stuff in the critical section.

+1. Let's do a scoped guard for locking clarity.

Matt

> 
> Thanks,
> Thomas
> 
> > 
> > Matt
> > 
> > > buffer flush, though). I think it's worth spending some time on
> > > this.
> > > 
> > > Thanks,
> > > Thomas
> > >    A. 
