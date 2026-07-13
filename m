Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1728C43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 15:41:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A912B10E35E;
	Mon, 13 Jul 2026 15:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OLNPjvsn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589DD10E35E
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 15:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783957318; x=1815493318;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7hpBhFHErpoz2Uac0fizHz+gTMzvm1FB4xIf3PWmpNA=;
 b=OLNPjvsnuvpmPweZWzn4vE0Zaqm0Ux1qAgQLX44fsyWMyXt8BQn2qlHq
 9CUg2HOq/gleOlQBWWkIgF8U0S3pF5owIqlSUQghP0tv4LaYX/sqzHV1u
 XuI9gXKAjVEaHcRH6/IY+PIgaNVLP5TQWrB1cuHctR67kJbFh3ByIPcIa
 cpsrcIVjlBpfbY+wdG2v1XEGoL1alUOMfvJcgt2gHJ69k7A1nNyAKYb5O
 IVziazNvG3qIDVSoOJOemZPgFCt4eFAqogOyfuExcvDTqylswtMze5Y8B
 g46TcfF8YUbTaDAP2JxxxIyCZVLBXExc2nkeh9NV3SOmszi010DGR9XJy Q==;
X-CSE-ConnectionGUID: 1OaLJO65SkiAxJVkQF6wQQ==
X-CSE-MsgGUID: HgHKys3ZT7m54GDgjC93Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84345979"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84345979"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 08:41:57 -0700
X-CSE-ConnectionGUID: xE8W3nTWRY+SN+rqhZ5JPg==
X-CSE-MsgGUID: kINISYmqSnqfTUXRNxISsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="253853204"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 08:41:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 08:41:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 13 Jul 2026 08:41:56 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 08:41:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKUEkQKGbN8SBcqZaalOvzavn9KCNjd7ta9sUyuIcABCMKv653dN/HPr6XhodAHXTHVWcmfX/jlRjrvuP4Qzjewj3LW0yAKz27qg7132Z3aLEb2+xqHwK9lQRzdAz2i++FeLxBfwFyU17RfPMEIjoDyRqHFbB10GBN7htM0m1Q/6Bv9FGtOuDsyQnIlgtPVw+EO58BH8DIbB+O8Qe3pR1nDzenjx5Um8A3KOpUlI8LSslreUayJ4D8af87DmXdkSDqc/AYq0Q1nKK2kjsvTfrpLBuR1pjx0jxV9EQKcuaurMJ8R9UHVxa/hzrySX0RzbS21EaZglPfvyPGtjORnAgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pz/O9+3g3mbYN/jsuytKFJEh7IzoAce90cspeaK6Op8=;
 b=pjiX9yaxUpFmFhntCKPcLXUnV1vyAQmmKsf7FVORbgiDUwP2hoZF8wOslJvrM90zaeSX1xuQBNO9Oo0OuN4/GZ2oqcUmnOYbozGExjxt/bGjxhkQP16RqXO3DFSyxkCqN7lpThdId7qHz0VCvAiSWitxaPPhy0riXxny+b966QcgXqfng6JeBxdLyHuaFFkTZDNdAVgRGI8a0hIlhjOYr6fwr1fzoQvouLDawKuz6HZBopRBjymM27E461pugxFZ0X+B6gWeeuiQinka67c2pwyYWkw7V+9tVqxtYq+lGTi+Jl7c2625nk3lHf4vd5ly88Qui6JH+763SmXcB6pyeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by MN6PR11MB8242.namprd11.prod.outlook.com (2603:10b6:208:474::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 15:41:53 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0202.018; Mon, 13 Jul 2026
 15:41:53 +0000
Date: Mon, 13 Jul 2026 11:41:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Disable display in admin only PF mode
Message-ID: <alUHPv-03v0Jg-5g@intel.com>
References: <20260611124206.3742717-1-satyanarayana.k.v.p@intel.com>
 <20260611142127.v2ehvhyrpjtlpwyo@intel.com>
 <20260615082147.hikfrzt3c7tpgqtt@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260615082147.hikfrzt3c7tpgqtt@intel.com>
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|MN6PR11MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: 61cde073-dc44-48ad-5376-08dee0f54369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|4143699003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: jP0dIrmsOJf1Nv8v5F34CFUOap1bChJEmh4/DDqWDSNxNQltcadtULjODBEpIJklULLyarqi3xwkR7O2SuzlJchhS7tAtp+NR2R8XNRvogxB9ppSGTUdxfeTeduymh8kOlADB88WR+YBiWYe7nN3PzLay1ukwqHDZp86J7iyquWNJPQXhOg1sJ+q+0BhXqcijPhq7JmarvK1gzBrhbsFxD0V5PDkQhGyLK7ILunNdmdsj9upEC5wa/5ETHP4DERBJ3hOsDP+rSlQ1oIsp11VU8ApBmAzJnOPCqthT1FHeuyXozmsKhzzxr6f2GiL27l9ZrViLFcDwhqF1VAznv/ZImdlozBN3qmHIxeGP8HYkheyALVoJ98ih9i7R0A/2qOtkwapjloYG3ykf8tXDh6yM4hoD2Kco5PRxSVBlYdJDOct6wjymst+raLT6DTUi/ndEZqFjuAISqhE/VUdq+G9TZeYQFWgPYO+5ezykQOeAlRgCkdZ4+JpYEcQyWPVj3XSDUPLez2qAsZl9+MkFAzkXnvy5JhK7PvCDNS9T+RrmI3H3uGT5ak4OUgr5KEbTDLErOXFisCI8dbEh5N3gjyk1yIfBQZrPSUMxP68M3Sm21jOVO8ZBO/kk+rpbjnnfld/u5TXT7hxNFh9vLl8AaBoF0h3J+eCIKpCDswO+wo6m5s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFZnYUdoSjBYZ1hDb05TNktPRHVkNVJKcmJ4a2QzTlR2OVROTVo5RE81aXFs?=
 =?utf-8?B?U29GRlNVd0ordHFPMXBkcFpYWjFweFl6VXVIVXNzNk9lbE5Bc3JtVnlhRW5z?=
 =?utf-8?B?emg5M0xpdEZidjdDSzV2R3Z2MVVnNGtMV2twa1RhbGJiWFcwWXF3bmdvLzA0?=
 =?utf-8?B?eHRIRUJVU2tUdUVjTjBwaytNUVZZSkFPUERJdEdsc0kwR1crbWJPcjlsa2lx?=
 =?utf-8?B?a1hpNnJ4SlJWRG5FVzNTU0pXM0hvcXlBMlZYRzNPRXUwZzc3S3pCSk9ORDgy?=
 =?utf-8?B?aS9xWE9QMjB4THk1aXFPT1JoQ0xDQ25CUTlBQkNLYkRqTVorbExOUlQzZi81?=
 =?utf-8?B?ZFdIQ0lTL1FpeCtvOW9IOUFrOVdSeCt5MlBNYzUwbFVDK0F5dmgydVBla1R3?=
 =?utf-8?B?QVpUWlU2WTUzbWJ3NHp5b3NxNHJXWmFxY1dNVEphRkpwNkxCNS9uc2F1Y3Bt?=
 =?utf-8?B?TnZ3ODhJY0duZEN1S0gxTll1ejVoeUE0bzVUTHlzZHY5UUtRdlQrRDVLZXR5?=
 =?utf-8?B?dTZoR3ZVTFRyOEtXajFob1ZoN0svY3FVejZnbyswbVNSYnBXYlpNaW9vdVZR?=
 =?utf-8?B?SWRYdm9XQkkrSTZDNExRNEFTdlJ2Q3NZejdaeXExbXVGbnEyRCtBdlpQZHRC?=
 =?utf-8?B?dU1waHZuckxxMS9jMzQ1dnFXVm9iTjVBWWRZMGNBTC9RWHRNVmYyQjNKbHJP?=
 =?utf-8?B?VkFGSVJvd05UQ2QxSDY4MHV6ckpvbTNpbXZFWElraHJ1c00wS09mYlZHZEdB?=
 =?utf-8?B?bmo1eDlqVkJWL3U2NGQwYUs2aS9DeTdVV0FQNk4yOE0yZ3hGL1hubTh1emlv?=
 =?utf-8?B?ZDAyY1FiZkNVL2VoRUhaWGF1SG1LbWhjM1oyMWs4SEFITG93cXRTQnphNXEx?=
 =?utf-8?B?OW5uQnB5TlZ5QnQ3NElMTHNNT3ZhNmJyOG93c21zUUlIMzF6WlhBY0c0Z3R2?=
 =?utf-8?B?d2ovcEkyMDlsYUFjaVluTVBYdlVSbFZQdW1xVHZXaEJKNWI5cGxwVmluRERQ?=
 =?utf-8?B?U1RlRWlhYklkMDZWRnBrRWphcG1iV0VwTW5BbzZFcVM3bHVpcnZNd1piTnJy?=
 =?utf-8?B?Sm4wcGhsc3dEb2ltRjlDOVNzQlIwT0lFRzc2K3htUWNlSkoyTDdyN214Q0J5?=
 =?utf-8?B?cjVkWjN4a1JoejlBUlN1VVYwb2VBdXdLYVlMQk9oaE1acDBEN1RFcmszWFJS?=
 =?utf-8?B?S0RHTzNkemYxVy9LbG5mY3dSNmJGOCtJMXhvK2V1OXU4KzRYdlRtYnVjdGlw?=
 =?utf-8?B?R3BLc0ViSTFuUUZ2cW9LRFJqQ2lrR2dMYzVoMmpLZ2c3UFRaNlh3bHFKL1BT?=
 =?utf-8?B?RjZQWk5IMGs2dndrNUppbGI2ZEhhdFB4bEg1TzBLUUZTVkMxODYxemxqWnU3?=
 =?utf-8?B?OFN4ZjAvTDkrSWxVSnA3Q09acGI1Zm5jTUdRNnBBUmhRWG1JZE9DSG5SUUNG?=
 =?utf-8?B?YXZqamVMVnEwOUhaZnZlRFhGRWhjMmU3WXkyWjg4YnZJWis3ZXVXeGFub1hO?=
 =?utf-8?B?OS9QUjVnbFhJTmlSdERzb29paXpJS1VDQVY1Y2JXaHk2RldIYkt0R2d1aTdX?=
 =?utf-8?B?ZjlZZkVHODArQVJDVWMwM3U1M0RZRU1WU01DOWYycnhxY1pZeTExUC9aRGdY?=
 =?utf-8?B?Tk1IaHlrR2FZeHNUVjdmSG05RFMxM3Q1WWpJK29SaEtVcUVud2lqOXgvVXpQ?=
 =?utf-8?B?NzdrSXZDZ3NOMjhzS1AzUTVMQUo0NUZYMzdwaWpVYXh4bTZhQUdtcTlZdVRZ?=
 =?utf-8?B?SnhWc0haNmY3dWtsclpxbWVoYkVmMnZIY3kzWDBCTnlpZ0hIcTdaamFpdlRo?=
 =?utf-8?B?dFNHeTNtR2VkOXpNRmNqZHYyemJyem8vMy8yeGNRcWxDZ1RDQXBZQkZINHI1?=
 =?utf-8?B?UFRDMkM5alZUTFUrc0djY25oYUdqdnEyZWNiTyt6K1pRWXVhSVh3VFBRVzkz?=
 =?utf-8?B?UFExZHA5NlJnMmROeU1YU3h6NFEvUmpzTnhnRWRIYW00bkZvOVhtMVdiNyt2?=
 =?utf-8?B?WUhIZitjcG9ib2p1TXZKOFY2aERSTkNEcjNEd0RiSHZxWTQvYmpPeTFlaFl0?=
 =?utf-8?B?cXVhRFlxM0dORk1GaGVDT21KU1g1MWxpNlRzTG9Eb0Jwdi9HOEVYVDJXc1Bt?=
 =?utf-8?B?Rm9nYTBNUm91aTl6MFFyZklJMDMzV3JsaE41cUwzVTJ4OEJZSGlIUlRHRTZQ?=
 =?utf-8?B?RG9Ccm1BVFVOd1lnUFRiMW9HRnVuUHVLdHVoNE5lWWVqWUI5RVlvT3UybkxB?=
 =?utf-8?B?M3JOdUZ2UXRveFY5dnN6VHV3ZThLdnRkNjZJQlpwWFU5L0hJVENXQ0JuN2xp?=
 =?utf-8?B?NG9kSHZhK2FpeTNLL0c5WENwQkUvakdiL1l5WGtuNUp5c1UvajhTZz09?=
X-Exchange-RoutingPolicyChecked: WEpvb1VkyQlIBRMwMf0Cxy2k2xpQpT6MxnFfC24TFgla6MCeOoERWE2UpQ1dw+8UCYpFU27ZK3TBhhk+spVpK2jjuLfEhUH/1N5VhaaFNED6dB8bZJGCC/nbGrBn76H7Ld+P/pLdhIRQI+8cnWUZk2nuYJeBn5peUbH5AJ6yjKMTsO1Bz5G3LqOyHEQBDLtBl4kvxDnSGaJLrOHvFSglT8+jnM5sP7ub8i2Mjd+qc3Vqc6+hQv2UfsxuWaqmXsVaM1jMPs+fvq2620XjGrjlBKOpnXaG17toLJMAQcfbVl9xhpyLpvLwDOojGW8HNtbNjC66l5unFhWVD2/lT7A/aQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 61cde073-dc44-48ad-5376-08dee0f54369
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 15:41:53.7894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ulyAVJ5kTE8xLS1B9/h/cPVl8fy3geOxl7R9V0SOzYrM03aK3crvkbVZmI17OtgI65QdhHnFn58/1VLSXGPg5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8242
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

On Mon, Jun 15, 2026 at 10:21:47AM +0200, Piotr Piórkowski wrote:
> Piotr Piórkowski <piotr.piorkowski@intel.com> wrote on czw [2026-cze-11 16:21:27 +0200]:
> > Satyanarayana K V P <satyanarayana.k.v.p@intel.com> wrote on czw [2026-cze-11 12:42:06 +0000]:
> > > Admin-only PF mode does not expose media or 3D execution capabilities
> > > to userspace, so display pipelines cannot receive rendered content.
> > > 
> > > Fixes: d88c4bac8c2a ("drm/xe/pf: Restrict device query responses in admin-only PF mode")
> > > 
> > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > > Cc: Michał Winiarski <michal.winiarski@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device.c | 2 --
> > >  drivers/gpu/drm/xe/xe_pci.c    | 4 +++-
> > >  2 files changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 51e3a2dd7b22..9c02e0e314c7 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -426,7 +426,6 @@ static const struct drm_ioctl_desc xe_ioctls_admin_only[] = {
> > >  
> > >  static const struct drm_driver admin_only_driver = {
> > >  	.driver_features =
> > > -	    XE_DISPLAY_DRIVER_FEATURES |
> > >  	    DRIVER_GEM | DRIVER_RENDER,
> > >  	.open = xe_file_open,
> > >  	.postclose = xe_file_close,
> > > @@ -438,7 +437,6 @@ static const struct drm_driver admin_only_driver = {
> > >  	.major = DRIVER_MAJOR,
> > >  	.minor = DRIVER_MINOR,
> > >  	.patchlevel = DRIVER_PATCHLEVEL,
> > > -	XE_DISPLAY_DRIVER_OPS,
> > >  };
> > >  
> > >  /**
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index 78fc2e4dcfc6..6fd882443fa5 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -789,7 +789,9 @@ static int xe_info_init_early(struct xe_device *xe,
> > >  
> > >  	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> > >  				 xe_modparam.probe_display &&
> > > -				 desc->has_display;
> > > +				 desc->has_display &&
> > > +				 !xe_device_is_admin_only(xe);
> > > +
> > >  	xe->info.force_execlist = xe_modparam.force_execlist;
> > >  
> > >  	xe_assert(xe, desc->max_gt_per_tile > 0);
> > > -- 
> > > 2.43.0
> > > 
> > 
> > LGTM: Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> To make patchwork happy:
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

Sorry for the delay here.
I was going to merge it right now, but I got a conflict.
Could you please rebase and resend it?

Thanks,
Rodrigo.

> 
> > 
> > 
> > -- 
> 
> -- 
