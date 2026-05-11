Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B11CCD37BE
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 21:56:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC5C10E20F;
	Mon, 11 May 2026 21:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AixsJTrL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422A410E20F
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 21:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778536589; x=1810072589;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FmEwoWPcPRJB3cs3Hdy/d7GkwNwbGL2V4Q/hrYuaSS8=;
 b=AixsJTrLKiPY8+3qsJgI3ywI2lSQlD8uckM+4F1VIy8I0ZZqbtya52wv
 M2lnWniga4Wq4QhY6kSGMFkFMrUfDJlJJhPYD4fU5Jiv3y0XLAC3KhLf9
 1+S/GofJ4pu9HtR1Sm8+Ng01szqFE1UUxLgaI6Qg4KD2XvK7mMJy9Yklj
 sUBGESqSBnbnqz0MGJJI5tGgkP2VjWghQ6z/CWDQG+DXoNmyxwtmnBNih
 F2ikefwRfGlUzo0koWCiZ2Jr32p2ZG1O+1IFaMuuz38C1Yca/f8BGQWDX
 I7gJ874H0xKWbSJLWHf3B3hPS9Fkp4ZildxTS+eBPoI0+rk4kvde9WupA Q==;
X-CSE-ConnectionGUID: UeN3M8lrTl2/X2aFDvAuAA==
X-CSE-MsgGUID: CjU4p9zzQ+OtkdfelPfNEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="78583142"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="78583142"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 14:56:29 -0700
X-CSE-ConnectionGUID: T/2mQ6ZyRry9vcixZosQsw==
X-CSE-MsgGUID: humH5KWbSRGxRqmipd8cuA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 14:56:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 14:56:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 14:56:28 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 14:56:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wp/hv5JtAt5Mwq9Op4vtbMBvndvQ6NvbfLM0zRBroYN5w9MCHcezRXpTnQPYhciwqSkETnfxCHiOxL9ciMrBpRhgbfK7SHGySjoMZyYAToJDdwOcdKbtLQR8MHQd3FOlp10+kTjSuVK/bkaR349f0+TrmFaiWe+4SGEXd6X7fSK5OeFIPQ/gDh0MGXleo7sOV9jptbVhDjSX8E+7i062lIpZ0uxLirQA5QeFjlZqPdXZoEEdi/iioLWY+mT7LPYbkeXzpYetat6tlA4BsQMRafKpFZ5fpa5YKg4xmvQ6Tt9dwPe0xRyjsMGFYFldczqbj5GHOlSAzYfFv5OAFg7Wfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sp4//ZRHqg7Zcf1jR2O6l2XBgQfbnkr+VdAKZIA/vTw=;
 b=Qhnf37EPWDC1ykU+gF+9/2kHnTU8yxo420dzGUjpJEYm4xcEc8Fp2OYbxJ3hCF4ieTSjhE4tyJMfVtdGki2v1B0zUjhER57SYf4K9ftRmT81yW3BTFII7dp6wfFldeyc74+YYmZLvNCkdcEl8ZKqOJBVuzyTx8+Wdfa8OPW1+C4fd7bi5os+A8kXBw0l1DKPmI4LoTLpMvdOiCtEhzh4woPJPNDK5t3ZeOgWVWCa1Bp5yIcbh2Sf+4PP3PLrnMhc8mKKqvqurLnWcQp8InOP3pRC3KRz++Asx0uI9vZJUKCmzZGGblhCeYCMWx5uNbgHSfiXJ9GVDW/SrxBBeWCcZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by BL1PR11MB5977.namprd11.prod.outlook.com (2603:10b6:208:384::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 21:56:25 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 21:56:25 +0000
Date: Mon, 11 May 2026 14:56:20 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>, Anoop Vijay <anoop.c.vijay@intel.com>
Subject: Re: [PATCH v5 11/14] drm/xe/xe_ras: Query errors from system
 controller on probe
Message-ID: <agJQhB3JejOy0twT@soc-5CG1426VCC.clients.intel.com>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
 <20260511172908.1122252-27-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260511172908.1122252-27-riana.tauro@intel.com>
X-ClientProxiedBy: MW4P223CA0025.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::30) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|BL1PR11MB5977:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d0ebb9c-d5c1-4796-2a0d-08deafa8258e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: /jq3hsUiXxqYs6w+4ZLm09qY57fFSRUTu2eBPw2aRM3uZExP0tNV4TpZYqSKjmvgac8SQcLvymY/I41KVbWVAIrGY63iAlMardZYn5y8NQD9G9gLn+LR6qCTDV6a2jZ2bzpdLdvD+VjsAp7lGeUBM5lJhDq4iVBsPQlyY3O52ETXgVcUJQ0ZLu3GyPxTFYzC95+EDwUzVDV6OKcVWJphH1W5fYIk7UCojiMCiSJZ4cZ72t8gZ8IMxrl84AvJSvCcfmWUtcyWfUH6qn50M/NUrDtAY50qmpxHV+b5apnV5V6hKnr2u9ldPEl17wB/EROFPlMYFuD9sEXVyi3Ap0I4sxtaXprp7ZDnWf5LOzs6b69ajYMPIQySW8HL00e0lmZOmt+B/thDZPFAn4I07gMkqlUHb4Zv1G3OjkNzZeVLuGayXiHD/RJJP/ktFCOljdsNG2aPzOd7Ytq0HWMAd7GcdUkwkxZ5Y+xiXRhZX36BDeJEHhXm5hBw1XFrkfubL/dJNmE4SphRV7mCub23kiX30QVzVAmFHGcZQeH/WJg4Dp6dgu/lyFcPpUHCdGmf68Gk6QXEK7aYBFP9oPU/D0nBiwwenGsaVUifOJ0JijjJe+Mr5UWsnvQR+2m1Q6XfzkIPOpy3gFF6T88DMEXlTFxbMZamvJvCwnFxQ+Vqxv4l2n0Rd3AZ7ZXuIQ0KfUAVfeQm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(11063799003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmpjekRPOHZEWG02QTY4OEROVG9LeTFmUnRPY2hUVnZGdmlrYmNNcmdQdkFV?=
 =?utf-8?B?YnZKRTlQMW9TbGdvZnZud0Vxb3ZnTkd6bzVvcUljZFA2MEFKcGc4SWxGZVFw?=
 =?utf-8?B?aVpVeWQycGZsampPeUJiTVhmeVgyeUUvYXRqQWQzM0w2WXhFNXZVQkVmanNv?=
 =?utf-8?B?a2FuSEFGLzV1T1dmTEtNTXVTVVp5TFlRV1R4Q2NPR1pYOUlObVp4eWdQZE81?=
 =?utf-8?B?UDRQMmw2eXMrZHkzV2FFd0FET0hCaXJuR2lOQVR6RFlZVVNLZVluVHV4TjhY?=
 =?utf-8?B?SFVCVlRkYlprSVBqRHFmQVVzdmFjaHFtaUNGbXVjZDdYSVVDTW9HTEIvSStH?=
 =?utf-8?B?di9ZV1ZTNmhZL3VqRTRuNnpIc25LKzVYbWtaM1NPYk5Pb1dxL21aVkY0Ris3?=
 =?utf-8?B?VEREVVNIZUFsYy9mQThjYXdzU00xRFR5SFdrTnBhSmZhWFQrK2t0QUhOeFNZ?=
 =?utf-8?B?ejlGU2FaQnJnZE1rUnl2NkFiaGY5Z3NFQlMxRE55b2RHQUhkNjBudzZkaUtT?=
 =?utf-8?B?MXpPVSt5SmtZSFlqNEFwME5QYkFYeWdlVENQR1B4L2cxQ0pBVVhwa2pZNXZq?=
 =?utf-8?B?a0hjbGdxeHBRNDExUWlrVnJlajBJaEhiUmx4OEFIQ2dya3JQN3BJSVBTckJD?=
 =?utf-8?B?Rng0ODMyT3BNdHh3bERPSnJ2a0NFL2k0REtsRmp3V0tJT2ZNYlFaUnlhcmcr?=
 =?utf-8?B?MDBtWW8xeThjSlBSMmo0WWNGK3FUMDQwYXFTenpzMmwwdjBYbVVuOFZDRS9z?=
 =?utf-8?B?Y2VMNE9qNkcrcDNJNEFzcFJKdlUySGFteWRKbnQvWWJVVTBWeCtxZUVUVWdS?=
 =?utf-8?B?ZDIyNzdsODdueDlTWHlUMUpXcEhQbmpQT2l4bmxyUUZ2Y082bnk4bVZJTFBU?=
 =?utf-8?B?K3Rwa2JlaW5NR1VMOXNRNHNkTUVKS2lhNGdmQ1VNazh6UnhuWGh3SzB2cHBh?=
 =?utf-8?B?RzZmZUM1YXZ0eThvOEU1YmlZZ0lWckQvSDBkdE9VU0Uwd0Z4TWp5cEN4aTVJ?=
 =?utf-8?B?NWNTM0tEMG1JYjNHSVhjT2V2Z1R3eHI3MFhTZFpoOVZ1ZkJrV3o1R0JZckNv?=
 =?utf-8?B?Wmx6eXY4WTFmSXRvZVNGbnhldlV0TUd6S0ZQQWJrUjBCUERlK1lXa2hTSXd4?=
 =?utf-8?B?ZlNCVzdMQTVuWHRwUkpZWlE5bys4UEY0U3p3MDcrUGZhSjI5d2VkL0xYZUZ5?=
 =?utf-8?B?Q0JuNkhoQkg4MVBNQVNQTzVqSitQSm1UaTJabGl1Yjc3cEl2WEY0cGN0TFRB?=
 =?utf-8?B?MU1GTEoyNDdrU2pyMm5VZ1JpUmtnelZQbXV5WGh1a2xseDlBYXZXaGRsMzNH?=
 =?utf-8?B?Z0RGU1NYbi9CQ1dzSUVzcTB5THpiWGJ0SUZ3emhkczlnWHlESkIvUisrZVdv?=
 =?utf-8?B?MVFqMUE2TWNXYmxGK3ZacXcrVlQxUUx1UTZMRldSdVJDbFI4Y1dubkxiOXd2?=
 =?utf-8?B?K25CK2RkbDdhTFZmZ0FxYlRoc2RISVg3eFF6OW5iVFIyN0ZjWFYvWlhKR0Qy?=
 =?utf-8?B?MXlvWE0rektOR2pORTJ1QmV4bStWcGowUmFFdDMvODY4NDdLWFBRQVJsL0wx?=
 =?utf-8?B?VURjeFk5bmhBYVBJTHhuSnkzUmJoV1ptQmZVL3hSejJ0dmJtQ0ovWUorUHlE?=
 =?utf-8?B?S1RQcjUzWEJETnlxMGhHZmtUakVWaHpNS0J1ZS9MeldkRUo1M080OTBVSWdS?=
 =?utf-8?B?SzhYVE83dmZ4Wk9abW40S0E1NGl6NVRUK2VaZjVET2J3djdrOWhrQjFJTW5H?=
 =?utf-8?B?Q25Ydjh3OHRKOVBkSGlzdksxWGQ4YXRHTzBuN3dUZmVxa2dlVHVwU29helBQ?=
 =?utf-8?B?V1FBTUtYM1gzUDlxWWI1UUhnby9jSTlnbXRCSFJFUUwrYWk2VlNnVmoydEVC?=
 =?utf-8?B?UVphR0FyTWpLbEY5bFpOeUh2RUFLejhsVW5qTUMxZk5IdVB6WXJaeS9lODd6?=
 =?utf-8?B?ZE16Vk44ZmFjQ0RHSGNNYld0MFdqM3U4UHVYSHpSMk1QNVUxcjVscCt3WnEr?=
 =?utf-8?B?K09ZckxlU0RuRTNzbG55V2l5TG95bG52WWNoOTJOZE5md1dadVJRbjJ4N3Ex?=
 =?utf-8?B?cDROTjNKSWpMUlBpRlc1VGJ0WWg2enJXRW5kc1hQVnlzN0lKUkdJd3dkN3dR?=
 =?utf-8?B?S2tGOEdnUEtIWWNFQXUvSkR1bytvYzNCVHM5QjEzeVV5R0NEeS9BS2hYNUl2?=
 =?utf-8?B?eTdTU2swaEkrL2ZTdUFQS1dSYTZnd2F3anFiSTJLMXYrbnBxVUs0OWJLZ2s2?=
 =?utf-8?B?V09QVjdlNzRCOGsvaGRuK0pWVnFCNjdVOXhYemtVUUhnMWFhZkpyckNaNVFL?=
 =?utf-8?B?MVh1M01JVmYvT0hRR0RsajAxVHY2NjNQc2IzdjZENkF2Z25ZQWo3RE15dEZG?=
 =?utf-8?Q?Q6P9Y5EELKGQkyE+Cz1j+EXK7yuengVI+owvB?=
X-Exchange-RoutingPolicyChecked: X8b0ly0MgQXy2S7XFpZ/O1ETbDXs3obGJuE8Cu4GYfz4DWeiUg2ow/+mW6BEBExy9+VyDwEcxE09KBwqUQCUD3A10IxntMDepen7LWDnlbx0hb98pjwkhI2pI2GM7iEpTW2vXkHVr7dVLEM3AadyLN+SIbnmXKYPZ5Yn/BXryS6B5UzSvaT1LGZn+DvY2RULrCK6mtq9zMVHCMVwTAWmu7DkujXrJXG0U3UHPYFSv2iTCgUEtKSYVOUwuiCdN5KPFN3/NlE94luhmnz+XUrATvtDiwiBmIQQy4Dwf3JPppNTBlh67ydXPxKIbss+wiudFs3eC5DJEO/xgAOxs56jCA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0ebb9c-d5c1-4796-2a0d-08deafa8258e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 21:56:25.5156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OnGQAhpIipQSn1EnY6OhIdmIPJj5vxklyfXKaEqXmCzVSDnee8qs/y+eD+1w+Vyoet0AqAoe+r333pRtl0B++xJPQTQsQ7sVX8XcPk0Scxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5977
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

I think the comment you have in the code above xe_ras_process_errors() 
makes a good commit message since it matches with the title for this 
commit. You can add that you reordered stuff to do so.

On Mon, May 11, 2026 at 10:59:18PM +0530, Riana Tauro wrote:
>Reorder soc remapper and system controller initialization to
>early probe to allow querying errors on module load.

nit: Looks like you are moving code within xe_device_probe, which is 
fine, but since there is also xe_device_probe_early() in the driver, I 
would just say "Move soc remapper and system controller initialization 
up in xe_device_probe to allow querying errors on module load"

Rest looks good,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh
>
>Cc: Anoop Vijay <anoop.c.vijay@intel.com>
>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
>v2: fix comment (Raag)
>---
> drivers/gpu/drm/xe/xe_device.c | 20 ++++++++++----------
> drivers/gpu/drm/xe/xe_ras.c    |  7 +++++++
> 2 files changed, 17 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 200d6bbb1b70..041af7ffc8bb 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -963,6 +963,16 @@ int xe_device_probe(struct xe_device *xe)
> 	if (err)
> 		return err;
>
>+	err = xe_soc_remapper_init(xe);
>+	if (err)
>+		return err;
>+
>+	err = xe_sysctrl_init(xe);
>+	if (err)
>+		return err;
>+
>+	xe_ras_init(xe);
>+
> 	/*
> 	 * Now that GT is initialized (TTM in particular),
> 	 * we can try to init display, and inherit the initial fb.
>@@ -1003,10 +1013,6 @@ int xe_device_probe(struct xe_device *xe)
>
> 	xe_nvm_init(xe);
>
>-	err = xe_soc_remapper_init(xe);
>-	if (err)
>-		return err;
>-
> 	err = xe_heci_gsc_init(xe);
> 	if (err)
> 		return err;
>@@ -1045,12 +1051,6 @@ int xe_device_probe(struct xe_device *xe)
> 	if (err)
> 		goto err_unregister_display;
>
>-	err = xe_sysctrl_init(xe);
>-	if (err)
>-		goto err_unregister_display;
>-
>-	xe_ras_init(xe);
>-
> 	err = xe_device_sysfs_init(xe);
> 	if (err)
> 		goto err_unregister_display;
>diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>index a1ae7a3d9696..b99c092a1799 100644
>--- a/drivers/gpu/drm/xe/xe_ras.c
>+++ b/drivers/gpu/drm/xe/xe_ras.c
>@@ -450,4 +450,11 @@ void xe_ras_init(struct xe_device *xe)
>
> 	get_queued_pages(xe);
> 	get_offlined_list(xe);
>+
>+	/*
>+	 * On init, process and log any errors detected by firmware before driver load.
>+	 * Critical errors such as Punit, CSC are reported through PCode init failure,
>+	 * causing the driver to enter survivability mode.
>+	 */
>+	xe_ras_process_errors(xe);
> }
>-- 
>2.47.1
>
