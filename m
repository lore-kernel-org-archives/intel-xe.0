Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37947C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 21:00:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB6B10E321;
	Wed, 19 Aug 2026 21:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XWsxGj6n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5CF10E1CD
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 21:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787173232; x=1818709232;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D+BqWgEksdYnX2BJmLCvmlIO6l7VFedkL6O7+1XyXio=;
 b=XWsxGj6nICrZyzdVmH+eZguxBynRUQ/cWSxPav1BKrSn0STHhgOjDQ6i
 SdXrGgduZuPraix0dG4ZxRIw5jpO4117IoFKHkbLvPPKEs0bqAD14wZi3
 fxAUAhdjuBCXX7CN7ksBpqzf0rkNN7/KLtpP/YshsTdyeQGuOj9E3IKNm
 PjWN1N5wPdZJ9PIy7v9Amzk3fDIsYj4hDHe8nQdAvvLWAMjfnXvjjz0PH
 m8vskLJnZtLyUsbFmTyrH2+48MU0h+sEB8Y7gMdsH/5BivyzEo/94LLEQ
 H6LuOSsTe93AI73AhSbR99E+UCddO1tUPpzx3MJi2DSiQPfNAwJ8I340w w==;
X-CSE-ConnectionGUID: 94vW2DdkRtiUc7DUQtrvow==
X-CSE-MsgGUID: 3xmCt3HMTsWQdULQPuMoBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="99059107"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="99059107"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 14:00:32 -0700
X-CSE-ConnectionGUID: u/fjzWnUR7+Z7xE2/VX0hA==
X-CSE-MsgGUID: vS5A5IxXTKSynnx0WkN6ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="259510435"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 14:00:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 14:00:31 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 14:00:31 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 14:00:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ba0lREg9wmdaVdHEuBighBPvzHoc4IPRHxmqS63PVO0u1Uz/+mzf7PHJEC0PKzy4r+vZqp1OFD6ODCu4eLql/DkkAbvxgcQuM60jSqVDAfY0/lBX6Xvaz1O2ZTxg/0VKsuaHSPP/yWDOqsbiMjX/REtQ0iZ9d4f9maCoFs8bWpTv2VXVPJ3EdluxY5g/LWCTcqgdN63VUL5XL3iOdIagbOMxLdI4eezTzYO36XTmCt5FziiS2HUbhci8Hx+Hc3yOH26HQ8bnSeTbT3NyKy5iBF+ArorzF9kYTWj2uAbJJb26v8SAbJLEwXXt9jiRv4VpVlg5zbdKKy+wrbzFp2SyOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6Dy/lMtPXVWUnQnoieZc1YEJhjFSS/F92Q0RKI6K0Y=;
 b=I12kW7fprGiicz7SdSdDv9lZm2j4LXcpbtyX1WAxe8r+N6WIKQX4tfNR4qiyhWaD6w6xrUCovIhW5Ko2PFeGHGoKNvLaCpDPf2qh1BrxoyR0mDMQYNDZjzksKLDS1fOwzC1pTAIx2eiEzl/+DUT0c5IbXYjP6YUFEzP97cobCh25KIT7989kwcceWvZf2hjtntRMqHo7swFTqlVME8PIX0TZrsX/FnOgQWmHWjUdQcQhkHTy+IkE0jiqL04f1dWKfi0bB7r4GvrT0gyq4XwOOgnK2Q46vy+gGE7HbkytvJWJ+KlstjxE7ojyzIHQpZzOv3pBt9arzeRypHCWZZ1XRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6674.namprd11.prod.outlook.com (2603:10b6:510:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Wed, 19 Aug
 2026 21:00:24 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 21:00:24 +0000
Date: Wed, 19 Aug 2026 14:00:19 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Anoop Vijay <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v7 1/2] drm/xe/sysctrl: Add helper to query application
 status
Message-ID: <aoYZY8fMaqT8NNFk@soc-5CG1426VCC.clients.intel.com>
References: <20260814095306.2482289-4-anoop.c.vijay@intel.com>
 <20260814095306.2482289-5-anoop.c.vijay@intel.com>
 <an+G21kQjK+AUI9K@soc-5CG1426VCC.clients.intel.com>
 <026e7bf1-080f-4d95-965b-83c2afaf6660@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <026e7bf1-080f-4d95-965b-83c2afaf6660@intel.com>
X-ClientProxiedBy: MW3PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:303:2b::34) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: 950f7e6c-21d8-4e2c-775f-08defe34e349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|56012099006|10067099003|3023799007|6133799003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: RCGXKHlruEIymbeu+JPHCPtGUClSqHx/Px1SFz3g+hkW9PQNBWHYJKrrKu9zVz8vrMEyQe0FjPTsY+HwmAvdsFmUQeimktwMdc6tmAWuH+2EnXmm03s6dp+LSGIu5yxFjVfyBLi3oZuQOfk7L67YAVrUGJcUX2mZfesbaeOJC7IstenacsR5TN1hHrnA5ZdJavloFmB2jl8T8uHEkr38XLczHMsUhEsMJHI42dZRhZ6IEaE+VwAzAKVBFFhD8R24N84AiVTNY7b+eL43aAYmHOU0vc42Nh5j2M0koyciAEzEw01V7HQmC/8l3iargWHhNJ4cKg5uJFlpN8xcyF5IxuDKuK/THSbQow1nTu/w3a6w9J5cocpz+YJZ0hUALYeItiRkZhDLeZEWwXEz1y61Ivo8MvccwQJZrN264b2ps7PbvTeBAdUFfYgFK1OurNggvFDJQPomzSekuFEH1M5nT6hSwdwalpEdgzbZaEH+F1x9KXE9p2EoZDYloCkduLER0crK+U9EJf29gML1e6HRhNRI41Jbv2WH9fYCxQ2a6S7lbPUaxdO+lshPJPv2nTdKO/yZmaCq2Xz8gUMf7p+XZy77lVenUQz4aw6weEwufkJyLAciAp6W6BNLg4OWspeV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(10067099003)(3023799007)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXFybHBwbHhiOU9HZWF2czBXVzQ1Z0hBZWNmTVVtOFR5Skc0UGZjbVdudEFr?=
 =?utf-8?B?aGtvcVd4KzFEeERkRzlRQjdXVG5xS1NkeVljK3BOQ2VhdzZ1SWZ0bGM1ZG9q?=
 =?utf-8?B?UnJBUHlKY2VKbUJCaUhVenFnOXNvRm5NckpRU3ZHWjZIZFUwWjJwNWQ2aWJF?=
 =?utf-8?B?QUVnbFUrOVBLclJyMTJsUHZBTW9mbVBwMElwZHUxYmlHR082bUZRUGkvcjRu?=
 =?utf-8?B?OXZaZVRFNFR1SUNsUU9pak8wSERIODc5WEF6RHdvNURNQVFkeFVXRlhNZDA0?=
 =?utf-8?B?aS9WSEV5OVdUQmFRU1ZvZXUvOTJRZFpMeFZrdGVGZGhBVS8wWjUwVTBzaEJJ?=
 =?utf-8?B?eTByaUp1V0FmM0M2Nm1yUWhleDVhQ2lWSk9sV3dsL0FrUmxhVmFvK056TlZp?=
 =?utf-8?B?aWd1YktremswK0hHYmVJS0lTYm56KzRqM3pFWkVTWjlTcTRsK0hqOWJRQmp4?=
 =?utf-8?B?MUhQT2RaS1VaRWNRaHkzVWlhb1QrdFNvOHg3OHo2QTB0OHZpak8xQ2FqUGdH?=
 =?utf-8?B?MnBGbm0zV05CaFJHQmsrZC83QmRoQm5qY09VRExFUTI2OFQrNFgvdituVXJw?=
 =?utf-8?B?cE1YbzVKTHJTRUNYMnhKK3QrcUpIM2VwaGU2T29nK2R6bmwwdSt5QWtTaFlU?=
 =?utf-8?B?NDJCd1JPUEpXTGFITGk0TGtMTFpEeU9PUnhaSEpFZUlBbnhLdXB6NlZwSWl3?=
 =?utf-8?B?RzBHS3p4UlIyeElkdjdSWUR4bytuN25aVTJ4SURTSDhiaFJ3STMwc0FiSVhk?=
 =?utf-8?B?ZytGQTdSWEF4WXo4ZGJwNXJPcVh2Z294ZmFzSlp3cDRHejQ3N0xlNU5JWVp6?=
 =?utf-8?B?NXpsVlZJcTRsS3JETm96UU9XdlFVVW8zWHgvYTZGSUNWNDdVR1hrZjJWaDMz?=
 =?utf-8?B?d3Z5N1NKc0F3K1B4LzFoZEhFQ3JUd0xObDhPbFBobDR5OG1KL1k2SUFqc0o0?=
 =?utf-8?B?d0VWZTRsbjM3amIvRy80b254UzVpNWN4bktTQzdPR2tXaUlCSGVoL0t4YWFE?=
 =?utf-8?B?UU8xaTJyVXlZTDJUYUI0OXJCM0pPQW95TTEyQ0kwZE1JY0N6bXg0dHJ0UW91?=
 =?utf-8?B?UHJ1SUVLcGlIYTZVQWJhdU5kZTlLdituTFNISWZ5OFZJRFg5UmVNVVhtaWdV?=
 =?utf-8?B?QVFwemRkbnRmbjZkMTBwbkwvcmhJcUNZU3IvZnQ1Y21xd1grSWFNZi9JZkRJ?=
 =?utf-8?B?aCtZSldVM3VZeU9CWklrbjFkVW9RZTJoallDLzlGSklWT05zd21oVVpaZm5q?=
 =?utf-8?B?ZkNJN0xvNXJBcy91N1hoY1lzREo2dU1ROE9zNU82VXMydkJOLy9PTnZXM0o5?=
 =?utf-8?B?VzBVQ2N5SkYvOFNPTWZpNnZlY1FxYjFvTVVxbzdlUlNIRFRXQ3RQc2kvMUlu?=
 =?utf-8?B?RVFnR1d1R2NmUmJ5cC9Mamk3NTlRUk9jRHpRWVlVUEx6NU9TZmt0dnU1cmh3?=
 =?utf-8?B?NG4vVk9KbjIrU3gwT1FCTnJEZm11R2YrbFJVODBuY1htcVB1enBXeE5kQWZZ?=
 =?utf-8?B?UHpFY05GZWcrZWxKdDJuY3NETlRQcUhncHJhY2NKczRvRURxNjQ5a0cwWkNO?=
 =?utf-8?B?YTg0bW0wSmt1YjcyZ29lWWFnMldOSDJ2bk0zek9XUXdhZG1FNUZQMy8vdjB1?=
 =?utf-8?B?Z0F4b3JJdjdUVkU3ME54ek1SVVBxN0IvbnVYa1FuMzJZZVJSY3EvazRDY2NE?=
 =?utf-8?B?VGRDVU1NVDU1RDVseS9LdGhCOFVMUkYvN0lyUzVKR2cxVFFseW8xNXJPazNF?=
 =?utf-8?B?Tm9ITGR5aFBWckN1MTI4NWFUTS84eHpWMm85MXcxYzNpdFREbTluemI5cm50?=
 =?utf-8?B?WXQ1eEQ4SWdFMFJEeWQvbjlPZzQvRzZSdDB2QUhGYVh1VGw4R3pQcEM0OW92?=
 =?utf-8?B?WHNRSlA1WGMxbXh0Q1lLWnlReFRlLzhwUSttRnZOaktDVlFkQk5zMlNQVkRm?=
 =?utf-8?B?bDdacmlYVXNXRHQ3MjJsU05INjMwT2o4Q0NiVTc2dzlxMWdwSDltcWRLWnZ3?=
 =?utf-8?B?cU5ERXQ3a0ZkOHgveHk2ajN3cW1ZSnh5KzNaZitldVFtNEdxRC8wSkFUbFJE?=
 =?utf-8?B?U1Q2UkJNSDJ3YjNuSndLc2JWRm1nTHpmMysydGdKeXUyWG51QllYVmwwOUpM?=
 =?utf-8?B?VFpVNjRuMk1BMDM2YkNlenl0SDZYNUplSlRycnZ6SnBoQTJ2RkF0Wlljcmpp?=
 =?utf-8?B?K3RBR0pRYXl4WG9BU3pHYVJxQ2d4eGxkbGpic3B3eHJiNU5tSDRHaXk2R2xI?=
 =?utf-8?B?SGRzWFRNVkNHdUVESFpqZC93Wk56aHVoN0o1dFhEZkdadklVdmd2b0VycnJK?=
 =?utf-8?B?U3EvNklFUWhjMjdlSVhERTV5S2RJcUwzTFhSV3hFdWNUbnJ6T3hiZUJMYm95?=
 =?utf-8?Q?M4asbjYwUZOVkMGjOr6SGfrborN6nuaJyRmEH?=
X-Exchange-RoutingPolicyChecked: pr3x8emEQ68R0+NcLTVWjEnQ1sEtOpwhBmV4lQ6zjkICkZc3LhVRMHW3494wVmGBms3tMhss0Lct12FhtEmyp26Y+Gzy68l/dOkC79S4TeHkgKL7CUZxnStJRfZpKiuc4EbUuXntNqWNkgNKK6SwF39Av40vio1+1nXaFNPI2bts8YTgtVhQlwEU/n3LKphafGVk3twIVh/UJxL3SOBnM+Lemx8XWSi+Jh7H4oVChZhKf2kAdCkfHg8yFNE6Q+lJP1buKnq53inSShe47jRFdfP2bIuvr+TnBKfEkjO5mmSBt7M63foyMEkBJAXgpIYkd6qheqPbcTcCd4MNcAjTNg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 950f7e6c-21d8-4e2c-775f-08defe34e349
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 21:00:24.3375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +pyUuX4YJ5XtRZQgMkT5dG8GLfHPQGZMUMj/8c6k5TprYMDBmA9eLiXPR2OZhzs7nUoRtHSV8eXI0DaNqsO1SusL0DOSicdj8n9B4vtuJfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6674
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

On Tue, Aug 18, 2026 at 11:11:13PM +0530, Anoop Vijay wrote:
>   On 15-08-2026 02:51, Umesh Nerlige Ramappa wrote:
>
>     On Fri, Aug 14, 2026 at 02:53:06AM -0700, Anoop, Vijay wrote:
>
>       From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>       Add xe_sysctrl_check_app_status() to query the state of a System
>       Controller application using get_app_status_by_id mailbox command.
>
>       The helper maps xe_sysctrl_app_id values to firmware application
>       IDs and returns the reported application state. Add a convenience
>       wrapper to check diag firmware application readiness.
>
>       Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>       ---
>       v2: (Badal)
>       - Return SysCtrl firmware application states instead of errno for
>        application lifecycle conditions
>
>       v3: (Riana, Badal)
>       - Replace string-based app identifiers with enum xe_sysctrl_app_id
>       - Use get_app_status_by_id (opcode 0x05)
>       - Move mailbox definitions to xe_sysctrl_mailbox_types.h
>       - Return enum xe_sysctrl_fw_status consistently
>       - Map communication failures to COMM_FAILURE
>       - Add INITIALIZED state and status helpers
>       - Fix Diagnostics typo
>
>       v4: (Anshuman)
>       - Make xe_sysctrl_check_app_status() internal
>       - Remove unused app identifier
>
>       v5: (Anshuman)
>       - Rename OOBMSM status helper to use xe_sysctrl_* prefix
>       - Remove xe_is_diag_fw_ready() helper
>
>       v6: (Riana)
>       - Use xe_sysctrl_create_command() helper instead of manual FIELD_PREP
>        header packing
>       - Rename xe_sysctrl_get_app_status_by_id_{req,resp} to shorter names
>       - Use hex constant for application ID
>       - Move oCode application readiness helper to a separate patch
>       - Add xe_sysctrl_is_diag_fw_ready() helper.
>
>       v7: (Umesh)
>       - Clarify xe_sysctrl_is_diag_fw_ready() comment for sysctrl-less
>       platforms
>       - Move XE_SYSCTRL_APP_RESP_* flags and enum xe_sysctrl_app_id to
>       xe_sysctrl.c
>       ---
>       drivers/gpu/drm/xe/xe_sysctrl.c               | 80 +++++++++++++++++++
>       drivers/gpu/drm/xe/xe_sysctrl.h               |  1 +
>       drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 47 +++++++++++
>       3 files changed, 128 insertions(+)
>
>       diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c
>       b/drivers/gpu/drm/xe/xe_sysctrl.c
>       index 1db20be8158b..c53a26af3189 100644
>       --- a/drivers/gpu/drm/xe/xe_sysctrl.c
>       +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>       @@ -13,9 +13,11 @@
>       #include "xe_device.h"
>       #include "xe_mmio.h"
>       #include "xe_pm.h"
>       +#include "xe_printk.h"
>       #include "xe_soc_remapper.h"
>       #include "xe_sysctrl.h"
>       #include "xe_sysctrl_mailbox.h"
>       +#include "xe_sysctrl_mailbox_types.h"
>       #include "xe_sysctrl_types.h"
>
>       /**
>       @@ -29,6 +31,20 @@
>        * This module provides initialization and support code for
>       interacting
>        * with System Controller through the mailbox interface.
>        */
>       +
>       +/* Application status flags reported in
>       xe_sysctrl_app_status_resp.flags */
>       +#define XE_SYSCTRL_APP_RESP_VALID    BIT(0)
>       +#define XE_SYSCTRL_APP_RESP_BOOTED    BIT(1)
>       +#define XE_SYSCTRL_APP_RESP_INITIALIZED    BIT(2)
>       +
>       +/*
>       + * Known System Controller application identifiers, keyed by firmware
>       + * application ID.
>       + */
>       +enum xe_sysctrl_app_id {
>       +    XE_SYSCTRL_APP_DIAG    = 0x0D,
>       +};
>       +
>       static void sysctrl_fini(void *arg)
>       {
>           struct xe_device *xe = arg;
>       @@ -130,3 +146,67 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
>
>           xe_sysctrl_mailbox_init(sc);
>       }
>       +
>       +static enum xe_sysctrl_fw_status
>       +xe_sysctrl_check_app_status(struct xe_device *xe, enum
>       xe_sysctrl_app_id app_id)
>       +{
>       +    struct xe_sysctrl_app_status_req req = {};
>       +    struct xe_sysctrl_app_status_resp resp = {};
>       +    struct xe_sysctrl_mailbox_command cmd = {};
>       +    size_t out_len = 0;
>       +    u32 flags;
>       +    int ret;
>       +
>       +    if (!xe->info.has_sysctrl)
>       +        return XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>       +
>       +    req.app_id = (u8)app_id;
>       +
>       +    xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_CORE,
>       XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID,
>       +                  &req, sizeof(req), &resp, sizeof(resp));
>       +
>       +    ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
>       +    if (ret)
>       +        return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>       +
>       +    if (out_len != sizeof(resp)) {
>       +        xe_err(xe, "sysctrl: unexpected get app status response
>       length %zu (expected %zu)\n",
>       +               out_len, sizeof(resp));
>       +        return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>       +    }
>       +
>       +    flags = resp.flags;
>       +
>       +    if (!(flags & XE_SYSCTRL_APP_RESP_VALID))
>       +        return XE_SYSCTRL_FIRMWARE_APP_INVALID;
>       +
>       +    if (!(flags & XE_SYSCTRL_APP_RESP_BOOTED))
>       +        return XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED;
>       +
>       +    if (!(flags & XE_SYSCTRL_APP_RESP_INITIALIZED))
>       +        return XE_SYSCTRL_FIRMWARE_APP_BOOTED;
>       +
>       +    return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
>       +}
>       +
>       +/**
>       + * xe_sysctrl_is_diag_fw_ready() - Check if diag firmware is fully
>       initialized
>       + * @xe: xe device instance
>       + *
>       + * Returns true if diag firmware has reached the initialized state,
>       indicating
>       + * it is ready to handle requests. On platforms without System
>       Controller
>       + * support there is no System Controller mailbox to gate on, so diag
>       firmware
>       + * readiness is not tracked through this path; the function
>       unconditionally
>       + * returns true so callers are not blocked by this check on such
>       platforms.
>
>     I am still not clear how the caller will handle the 2 scenarios - (1) SC
>     is present, but diag app is not initialized vs (2) SC and mailbox are
>     not available and hence Diag App is not supported. The caller will just
>     see true in both cases.
>
>     Instead I would see this as 2 helpers:
>
>     xe_sysctrl_is_diag_fw_supported() that returns
>     status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>
>     and
>
>     xe_sysctrl_is_diag_fw_ready() that returns
>     status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
>
>     That would be clearer to the caller.
>
>     Thanks,
>     Umesh
>
>   All current/planned callers of xe_sysctrl_is_oobmsm_fw_ready() /
>   xe_sysctrl_is_diag_fw_ready() (xe_vsec.c retry/gate logic,
>   xe_sysctrl_debugfs.c RAS injection gate, xe_sysctrl_fwctl.c capability
>   gate) only need a yes/no answer to "Can this functionality be used now?"
>    and treat NOTSUPP and 'not yet initialized' the same way.

Looking at all these callers in [1] and [2], I don't see a need for 
NOTSUPP. Both fwctl and debugfs callers seem to gate init/registration 
using has_sysctrl already.

I dont' know about xe_vsec, but looking at the code, it has specific 
implementation for different platforms, so it will not call the _ready 
helper on unsupported platforms. @Michael for comments.

We can just drop the XE_SYSCTRL_FIRMWARE_APP_NOTSUPP check in the ready 
helpers.

Thanks,
Umesh

[1] https://patchwork.freedesktop.org/series/171728/
[2] https://patchwork.freedesktop.org/series/161655/
>
>   Folding NOTSUPP into 'ready' is intentional. It lets sysctrl-less
>   platforms skip straight through.
>
>   Splitting into is_supported() + is_ready() wouldn't change any caller's
>   behavior, but would require every caller to do '!supported() || ready()'
>   check. This risks a caller checking only is_ready(), resulting in
>   unnecessary retries or failures on a NOTSUPP platform.
>
>   Given the current usage, I'd prefer to keep the combined helper and add a
>   more granular status/support helper in the future if a real consumer
>   requires that distinction.
>
>   Thanks,
>   Anoop
>
>       + *
>       + * Return: true if diag firmware is initialized, or if System
>       Controller is
>       + * not present on this platform; false otherwise
>       + */
>       +bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe)
>       +{
>       +    enum xe_sysctrl_fw_status status =
>       +        xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_DIAG);
>       +
>       +    return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
>       +           status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>       +}
>       diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h
>       b/drivers/gpu/drm/xe/xe_sysctrl.h
>       index 090dffb6d55f..8dc576796890 100644
>       --- a/drivers/gpu/drm/xe/xe_sysctrl.h
>       +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>       @@ -20,5 +20,6 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
>       int xe_sysctrl_init(struct xe_device *xe);
>       void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
>       void xe_sysctrl_pm_resume(struct xe_device *xe);
>       +bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
>
>       #endif
>       diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>       b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>       index d0341538ad05..f1e4253fda4b 100644
>       --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>       +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>       @@ -14,9 +14,11 @@
>        * enum xe_sysctrl_group - System Controller command groups
>        *
>        * @XE_SYSCTRL_GROUP_GFSP: GFSP group
>       + * @XE_SYSCTRL_GROUP_CORE: Core group
>        */
>       enum xe_sysctrl_group {
>           XE_SYSCTRL_GROUP_GFSP            = 0x01,
>       +    XE_SYSCTRL_GROUP_CORE            = 0xFF,
>       };
>
>       /**
>       @@ -38,6 +40,51 @@ enum xe_sysctrl_gfsp_cmd {
>           XE_SYSCTRL_CMD_SET_HEALTH        = 0x0C,
>       };
>
>       +/**
>       + * enum xe_sysctrl_core_cmd - Commands supported by Core group
>       + *
>       + * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application status
>       by ID
>       + */
>       +enum xe_sysctrl_core_cmd {
>       +    XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID        = 0x05,
>       +};
>       +
>       +/**
>       + * struct xe_sysctrl_app_status_req - Get application status request
>       + *
>       + * @app_id: Application ID for which to retrieve status
>       + */
>       +struct xe_sysctrl_app_status_req {
>       +    u8 app_id;
>       +} __packed;
>       +
>       +/**
>       + * struct xe_sysctrl_app_status_resp - Get application status
>       response
>       + * @flags: Application status flags interpreted by
>       xe_sysctrl_check_app_status()
>       + */
>       +struct xe_sysctrl_app_status_resp {
>       +    u32 flags;
>       +} __packed;
>       +
>       +/**
>       + * enum xe_sysctrl_fw_status - System Controller firmware application
>       lifecycle states
>       + *
>       + * @XE_SYSCTRL_FIRMWARE_APP_INVALID: app_id is not recognized by
>       firmware
>       + * @XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED: application is known but has
>       not yet booted
>       + * @XE_SYSCTRL_FIRMWARE_APP_BOOTED: boot sequence completed,
>       post-boot init pending
>       + * @XE_SYSCTRL_FIRMWARE_APP_INITIALIZED: application fully
>       operational
>       + * @XE_SYSCTRL_FIRMWARE_APP_NOTSUPP: System Controller not available
>       on this device
>       + * @XE_SYSCTRL_FIRMWARE_COMM_FAILURE: communication with System
>       Controller firmware failed
>       + */
>       +enum xe_sysctrl_fw_status {
>       +    XE_SYSCTRL_FIRMWARE_APP_INVALID,
>       +    XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED,
>       +    XE_SYSCTRL_FIRMWARE_APP_BOOTED,
>       +    XE_SYSCTRL_FIRMWARE_APP_INITIALIZED,
>       +    XE_SYSCTRL_FIRMWARE_APP_NOTSUPP,
>       +    XE_SYSCTRL_FIRMWARE_COMM_FAILURE,
>       +};
>       +
>       /**
>        * struct xe_sysctrl_mailbox_command - System Controller mailbox
>       command
>        */
>       -- 
>       2.43.0
